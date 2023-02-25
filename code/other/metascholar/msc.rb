# encoding: UTF-8
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'uri'
require 'cgi'
require 'set'

def hash_to_query  hash
  hash.map{|k,v| CGI.escape(k.to_s)+"="+CGI.escape(v.to_s)}.join("&")
end

def build_scholar_query author = "", query = "", start = 0
  host = "scholar.google.de"
  path = "/scholar"
  qh = {
    :start => "#{start}", #start at result no
    :as_q => "#{query}", #query
    :as_epq => "", #exact phrase query
    :as_oq => "", #OR query
    :as_eq => "", #exclude from query
    :as_occt => "any", #where words may occur
    :as_sauthors => "\"#{author}\"", #authors
    :as_publication => "", #published in
    :as_ylo => "" , #lower bound for year
    :as_yhi => "" , #upper bound for year
    :hl => "en" #home language
    #,:as_sdt => "", #???
  }
  url = URI::HTTP.build(:host => host, :path => path, :query => hash_to_query(qh))
  return url
end

def find_similar keys, key
  keys.each { |k|
    return k if is_similar?(k,key)
  }
  return key
end

def is_similar? key1, key2
  if key1.length < key2.length then
    sm = key1
    bg = key2
  else
    sm = key2
    bg = key1
  end
  return false if sm.length == 0 and bg.length > 0
  return scholar_strip(bg).start_with? scholar_strip(sm)
end

def scholar_strip val
  return val.tr("\u2026,".encode("utf-8"),"").strip()
end

def join_by_start hash
  nhsh = {}
  sorted = hash.keys.sort_by! {|x| -x.length}
  sorted.each { |k|
    k2 = find_similar(sorted,k)
    nhsh[k2] = [].to_set if not nhsh.has_key? k2
    nhsh[k2].merge(hash[k])
  }
  return nhsh
end
def freq h
  h2 = {}
  h.each {|k,v| h2[k] = v.length}
  return h2
end

class JournalParser
  #SLEEP_TIME = 15
  #SLEEP_OFFSET = 10
  def initialize data, pages, outfile, mode = "authors"
    @mode = mode
    if mode == "query" then
      @query = data
      @authors = []
    elsif mode == "authors" then
      @query = ""
      @authors = data
    else
      raise "Invalid mode '#{mode}' not recognized"
    end
    @pages = pages
    outfile = outfile.chop.chop.chop.chop if outfile.end_with?(".txt") or outfile.end_with?(".xml")
    @outfile = outfile
    @results = {}
    @alist = []
    @pnum = 0
    load_outfile()
  end
  def load_outfile
    return if not File.exists?(@outfile+".xml")
    xml = Nokogiri::XML(open(@outfile+".xml"))
    xml.xpath("//author").each {|a| @alist << a.text}
    xml.xpath("//journal").each do |j|
      papers = [].to_set
      name = j.xpath("name")[0].text
      j.xpath("paper").each do |p|
        papers << p.text
      end
      @results[name] = papers
    end
  end
  def start
    if @mode == "query" then
      parse_scholar_journals(query:@query, pages:@pages, save:"page")
    else
      journals_by_authors(@authors,@pages)
    end
  end
  def parse_scholar_journals (options = {:author => "", :query => "", :pages => 1, :save => "whole", :sleep_page => 40})
    defaults = {:author => "", :query => "", :pages => 1, :save => "whole", :sleep_page => 40}
    options = defaults.merge(options)
    author = options[:author]
    query = options[:query]
    pages = options[:pages]
    save = options[:save]
    sleep_page = options[:sleep_page]
    @pnum = 1
    pages.times do |i|
      puts "Page #{@pnum}"
      url = build_scholar_query(author=author,query=query,start=10*i)
      puts url
      page = Nokogiri::HTML(open(url,"User-Agent" => "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)"))
      page.css(".gs_r").each {|x|
        h3 = x.css("h3")[0]
        h3.xpath("//span").remove
        title = h3.text
        journal = x.css(".gs_a").text[/\ -\ (.*)[0-9]{4}/,1]
        journal = "" if journal == nil
        @results[journal] = Set.new if not @results.has_key? journal
        @results[journal] << title
      }
      save_results() if save == "page" or @pnum == @pages 
      @pnum += 1
      sleep(sleep_page) #sleep in order to avoid getting blocked
    end
  end
  def journals_by_authors authors, pages=10, sleep_author=120
    nr = 1
    authors.each {|x| 
      puts "Searching for #{x} (#{nr}/#{authors.length}):"
      if @alist.include? x then
        puts "Data already present, skipping author"
        nr += 1
        next
      end
      @alist << x
      parse_scholar_journals(author:x,pages:pages,save:"whole")
      nr += 1
      sleep(sleep_author) #sleep again to avoid getting blocked
    }
  end
  def save_results
    res = join_by_start(@results)
    File.open(@outfile+".txt", 'w') do |file|
      file.puts "Authors: #{@alist.join(', ')}"
      file.puts "Pages: #{@pnum}/#{@pages}"
      freq(res).to_a.sort_by! {|k,v| -v}.each {|k,v|
        file.puts "%3d - %s" % [v,k]
      }
    end
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.root {
        xml.params {
          xml.mode @mode
          xml.authors {
            @alist.each do |a|
              xml.author a
            end
          }
          xml.pages "#{@pnum}/#{@pages}"
          xml.query @query
        }
        res.to_a.sort_by! {|k,v| -v.length}.each do |k,v|
          xml.journal {
            xml.name k
            v.each do |paper|
              xml.paper paper
            end
          }
        end
      }
    end
    File.open(@outfile+".xml",'w') do |file|
      file.puts builder.to_xml
    end
  end
end

def get_modelica_authors dir
  authors = []
  Dir.foreach(dir) {|x|
     authors << get_author(File.join(dir,x)) if /author_[0-9]+.html/ =~ x
  }
  return authors
end

#<h1 class="main_title">Papers by Karin Fröjd:</h1>
def get_author file
  doc = Nokogiri::HTML(open(file))
  return doc.css("h1.main_title").text[/Papers by (.+):/,1]
end

#h = {"Document Analysis and Recognition,  …, " => ["test1"], "Document Analysis  …," => ["test2"]}
#puts join_by_start(h)
#exit()


ma  = get_modelica_authors('D:\Dokumente\Promotion\modelica\konferenz\Stick-Inhalt\html\authors')
puts "#{ma.length} authors found"
p = JournalParser.new(ma,4,"journals.txt","authors") #["Marcus Liwicki", "Markus Weber"]
p.start()
