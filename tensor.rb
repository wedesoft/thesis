#!/usr/bin/env ruby
require 'rubygems'
require 'benchmark'
require 'multiarray'
include Hornetseye
v = 100
w = 500
c = 1000
Benchmark.bm(32) do |x|
  m = MultiArray(SFLOAT, 2).indgen(w, w)[]
  n = MultiArray(SFLOAT, 2).indgen(v, v)[]
  o = MultiArray(SFLOAT, 2).indgen(v, v)[]
  x.report( 'GC.start' ) do
    GC.start
  end
  x.report( 'm = MultiArray.sfloat(w,w).fill!' ) do
    c.times { m = MultiArray.sfloat( w, w ).fill! }
    GC.start
  end
  x.report( 'm.fill! 1.0' ) do
    c.times { m.fill! 1.0 }
    GC.start
  end
  x.report( 'm + m' ) do
    c.times { m + m }
    GC.start
  end
  x.report( 'm * m' ) do
    c.times { m * m }
    GC.start
  end
  x.report( 'm + 1' ) do
    c.times { m + 1 }
    GC.start
  end
  x.report( 'm * 2' ) do
    c.times { m * 2 }
    GC.start
  end
  x.report( 'r[i,k] = n[i,j] * n[j,k]' ) do
    c.times { finalise { |i,k,j| n[i,j] * n[j,k] } }
    GC.start
  end
  x.report( 'r[j] = m[i,j]' ) do
    c.times { finalise { |j,i| m[i,j] } }
    GC.start
  end
  x.report( 'r[i] = m[i,j]' ) do
    c.times { finalise { |i,j| m[i,j] } }
    GC.start
  end
  x.report( 'GC.start' ) do
    GC.start
  end
end
