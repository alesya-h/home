#!/usr/bin/env ruby
dims = %x(xrandr|grep connected|grep -v disconnected).split("\n").map do |x|
  x.match(/(\d+)mm x (\d+)mm/);
  { w: $1.to_i, h: $2.to_i }
end
total_dims = dims.reduce do |result, new|
  {
    w: ( result[:w] + new[:w] ),
    h: [ result[:h], new[:h]].max
  }
end
divisor = (ARGV[0] || 1).to_f
ow, oh = total_dims[:w], total_dims[:h]
w, h = [ow, oh].map { |x| (x / divisor).to_i }

puts "original: #{ow}x#{oh}, new: #{w}x#{h}"
system "xrandr --fbmm #{w}x#{h}"
