class Lambda
  def lookup( value, stride )
    Lambda.new @index, @term.lookup( value, stride )
  end
end
class Lookup
  def lookup( value, stride )
    Lookup.new @p.lookup( value, stride ), @index, @stride
  end
end
class MultiArray
  def MultiArray.new( typecode, *shape )
    options = shape.last.is_a?( Hash ) ? shape.pop : {}
    count = options[ :count ] || 1
    if shape.empty?
      memory = Malloc.new typecode.storage_size * count
      Pointer( typecode ).new memory
    else
      size = shape.pop
      stride = shape.inject( 1 ) { |a,b| a * b }
      pointer = new typecode, *( shape + [ :count => count * size ] )
      index = Variable.new INDEX( size )
      Lambda.new index, pointer.lookup( index, INT( stride ) )
    end
  end
end
# $\textcolor{commentgray}{\emph{Example use}}$
m = MultiArray.new UBYTE, 2, 4, 3
m[ 1, 2, 0 ] = 3
# 3
m[ 1, 2, 0 ]
# 3
m[ 0 ][ 2 ][ 1 ]
# 3
m[ 0 ][ 2 ][ 1 ] = 5
# 5
m[ 1, 2, 0 ]
# 5
