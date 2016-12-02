class Lambda
  def []( *indices )
    if indices.empty?
      self
    else
      element( INT( indices.last ) )[ *indices[ 0 ... -1 ] ]
    end
  end
  def []=( *indices )
    value = indices.pop
    element( INT( indices.last ) )[ *indices[ 0 ... -1 ] ] = value
    value
  end
  def demand
    self
  end
end
class Pointer_
  def []
    demand[]
  end
  def []=( value )
    store self.class.target.new( value )
  end
end
