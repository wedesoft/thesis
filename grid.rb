#!/usr/bin/env ruby
require 'erb'
erb = ERB.new File.new('grid.erb').read
c = 0
File.open('calibration2.txt', 'r') do |f|
  while not f.eof
    matrix = f.readline
    if matrix == "\n"
      matrix = 'matrix<1,0,0,0,1,0,0,0,1,-50,0,0>'
    else
      matrix = "matrix< #{matrix} >"
    end
    File.open('grid.pov', 'w') do |g|
      g.write erb.result(binding)
    end
    system "povray grid +Igrid.pov +Otmp#{"%04d" % c}.png"
    c += 1
  end
end

