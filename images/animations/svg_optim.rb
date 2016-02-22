def round_numbers(svg_text)
	svg_text.gsub(/\-?\d+\.\d+/) { |s| s.to_f.round(2) }
end

def opt(src, dst)
	File.open(src, "r:UTF-8") do |fsrc|
		File.open(dst, "w:UTF-8") do |fdst|
			fdst << round_numbers(fsrc.read())
		end
	end
end

src = "pacemaker/ion_channels_animation_pacemaker_base.svg"
dst = "pacemaker/ion_channels_animation_pacemaker_optimized.svg"
opt(src, dst)