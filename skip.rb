#!/usr/bin/env ruby
require 'rubygems'
require 'hornetseye_ffmpeg'
require 'hornetseye_rmagick'
include Hornetseye
input = AVInput.new ARGV[0]
prefix = ARGV[1]
c = 0
n = 0
ARGV[2 .. -1].each do |arg|
  while c < arg.to_i
    input.read
    c += 1
  end
  input.read_ubytergb.save_ubytergb "#{prefix}#{n}.png"
  c += 1
  n += 1
end

