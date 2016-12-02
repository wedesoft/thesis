class INDEX_
  class << self
    attr_accessor :size
    def inspect
      "INDEX(#{size.inspect})"
    end
  end
end
def INDEX( size )
  retval = Class.new INDEX_
  retval.size = INT( size )
  retval
end
class Lambda
  def []( index )
    element( INT( index ) ).demand[]
  end
  def []=( index, value )
    elem = element INT( index )
    elem.store elem.class.target.new( value )
    value
  end
end
class Lookup
  def initialize( p, index, stride )
    @p, @index, @stride = p, index, stride
  end
  def inspect
    "Lookup(#{@p.inspect},#{@index.inspect},#{@stride.inspect})"
  end
  def subst( hash )
    @p.subst( hash ).lookup @index.subst( hash ), @stride.subst( hash )
  end
end
class Pointer_
  def lookup( value, stride )
    if value.is_a? Variable
      Lookup.new self, value, stride
    else
      self.class.new @value + ( stride[] *
                                self.class.target.storage_size ) * value[]
    end
  end
end
class Sequence
  def Sequence.new( typecode, num_elements )
    memory = Malloc.new typecode.storage_size * num_elements
    pointer = Pointer( typecode ).new memory
    index = Variable.new INDEX( num_elements )
    Lambda.new index, Lookup.new( pointer, index, INT.new( 1 ) )
  end
end
# $\textcolor{commentgray}{\emph{Example use}}$
a = Sequence.new DFLOAT, 5
a[ 1 ] = 4.2
# 4.2
a[ 1 ]
# 4.2
