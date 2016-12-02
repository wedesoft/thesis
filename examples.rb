#!/usr/bin/env ruby
require 'test/unit'
begin
  require 'rubygems'
rescue LoadError
end
require 'multiarray'
include Hornetseye

class TC_Examples < Test::Unit::TestCase

  def setup
    require 'const'
    require 'index'
    require 'match'
    # require 'unary'
    require 'binary'
  end

  def test_const
    assert_equal "Sequence(UBYTE,5):\n[ 0, 0, 0, 0, 0 ]",
      Lambda.new( Variable.new( INDEX( INT( 5 ) ) ), UBYTE.new( 0 ) ).inspect
    assert_equal "Sequence(UBYTE,5):\n[ 0, 0, 0, 0, 0 ]", lazy( 5 ) { |i| 0 }.inspect
    assert_equal lazy( 3, 2 ) { |i,j| 0 }.inspect,
                 "MultiArray(UBYTE,3,2):\n[ [ 0, 0, 0 ],\n  [ 0, 0, 0 ] ]"
    assert_equal lazy( 2 ) { |j| lazy( 3 ) { |i| 0 } }.inspect,
                 "MultiArray(UBYTE,3,2):\n[ [ 0, 0, 0 ],\n  [ 0, 0, 0 ] ]"
  end

  def test_index
    assert_equal "MultiArray(INT,3,3):\n[ [ 0, 1, 2 ],\n  [ 0, 1, 2 ],\n  [ 0, 1, 2 ] ]",
                 lazy( 3, 3 ) { |i,j| i }.inspect
    assert_equal "MultiArray(INT,3,3):\n[ [ 0, 0, 0 ],\n  [ 1, 1, 1 ],\n  [ 2, 2, 2 ] ]",
                 lazy( 3, 3 ) { |i,j| j }.inspect
    assert_equal "MultiArray(INT,3,3):\n[ [ 0, 1, 2 ],\n  [ 3, 4, 5 ],\n  [ 6, 7, 8 ] ]",
                 lazy( 3, 3 ) { |i,j| i + j * 3 }.inspect
    assert_equal "MultiArray(INT,3,3):\n[ [ 0, 1, 2 ],\n  [ 3, 4, 5 ],\n  [ 6, 7, 8 ] ]",
                 MultiArray( INT, 3, 3 ).indgen.inspect
  end

  def test_match
    assert_equal "Sequence(UBYTE,3):\n[ 1, 2, 3 ]", Sequence[ 1, 2, 3 ].inspect
    assert_equal "Sequence(BYTE,3):\n[ 1, 2, -1 ]", Sequence[ 1, 2, -1 ].inspect
    assert_equal "Sequence(DFLOATRGB,2):\n[ RGB(1.5,1.5,1.5), RGB(1.0,2.0,3.0) ]",
                 Sequence[ 1.5, RGB( 1, 2, 3 ) ].inspect
    assert_equal "MultiArray(UBYTE,2,2):\n[ [ 1, 2 ],\n  [ 3, 4 ] ]",
                 MultiArray[ [ 1, 2 ], [ 3, 4 ] ].inspect
  end

  def test_unary
    s = Sequence( INT, 3 )[ 1, 2, 3 ]
    assert_equal "Sequence(INT,3):\n[ 1, 2, 3 ]", s.inspect
    assert_equal "Sequence(INT,3):\n[ -1, -2, -3 ]",
                 Unary( :-@ ).new( s ).inspect
    assert_equal "Sequence(INT,3):\n[ -1, -2, -3 ]",
                 lazy { -s }.inspect
    assert_equal "Sequence(INT,3):\n[ -1, -2, -3 ]",
                 lazy { |i| -s[ i ] }.inspect
    assert_equal "Sequence(INT,3):\n[ -1, -2, -3 ]", ( -s ).inspect
    # assert_raise( NoMethodError ) { ( -Sequence[ :a, 1, :b ] )[1] }
    assert_equal -1, lazy { -Sequence[ :a, 1, :b ] }[1]
  end

  def test_binary
    s = Sequence( INT, 3 )[ 1, 2, 3 ]
    assert_equal "Sequence(INT,3):\n[ 1, 2, 3 ]", s.inspect
    assert_equal "Sequence(INTRGB,3):\n[ RGB(2,3,4), RGB(3,4,5), RGB(4,5,6) ]",
                 Binary( :+ ).new( s, UBYTERGB( RGB( 1, 2, 3 ) ) ).inspect
    assert_equal "Sequence(INTRGB,3):\n[ RGB(2,3,4), RGB(3,4,5), RGB(4,5,6) ]",
                 ( s + RGB( 1, 2, 3 ) ).inspect
    assert_equal "Sequence(INTRGB,3):\n[ RGB(2,3,4), RGB(3,4,5), RGB(4,5,6) ]",
                 ( RGB( 1, 2, 3 ) + s ).inspect
    assert_equal "Sequence(INT,3):\n[ 2, 4, 6 ]", ( s + s ).inspect
  end

end

