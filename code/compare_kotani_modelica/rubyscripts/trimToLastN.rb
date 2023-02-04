n = Integer(ARGV[1])
lcount = 0
data = []
first = nil
File.open(ARGV[0],"r") do |f|
  first = f.gets
  while (line = f.gets) 
    data << line
    data.shift(1) if data.length > n
    lcount += 1
  end
end

File.open(ARGV[0].chop.chop.chop.chop+"_trim.csv","w") do |f|
  f.puts(first)
  f.puts(data)
end
