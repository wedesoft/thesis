#!/usr/bin/env ruby
require 'rubygems'
require 'benchmark'
require 'multiarray'
include Hornetseye
# env HORNETSEYE_PRELOAD_CACHE=YES ruby1.9 ranges.rb | tee expression.txt
# sed -e "s/(s \* \(.*\)).*(\([0-9 \\.]*\))/(\1,\2)/" expression.txt 
n = 10000
c = 100
Benchmark.bm(32) do |x|
  s = Sequence(SFLOAT).new n
  for i in 1 .. 50
    expr = "finalise { #{(['s'] * i).join '+'} }"
    p = eval "proc { #{expr} }"
    p.call
    x.report( "(s * #{i})" ) do
      c.times &p
      GC.start
    end
  end
end
