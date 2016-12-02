#!/usr/bin/env ruby
require 'rubygems'
require 'benchmark'
require 'multiarray'
# env HORNETSEYE_PRELOAD_CACHE=YES ruby1.9 ranges.rb | tee ranges.txt
#  sed -e "s/.*new(\([0-9]*\)).*(\([0-9 \\.]*\))/(\1,\2)/" ranges.txt
include Hornetseye
c = 100
Benchmark.bm( 32 ) do |x|
  for i in 1 .. 250
    s = i * 40000
    m = Sequence(UBYTE).indgen(s)[]
    GC.start
    x.report( "Sequence(UBYTE).new(#{s}) + 1" ) do
      c.times do
        m + 1
        #GC.start
      end
      #GC.start
    end
  end
end

