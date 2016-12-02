def lazy( &action )
  index = Variable.new INT
  term = action.call index
  Lambda.new index, term
end
# $\textcolor{commentgray}{\emph{Example use}}$
l1 = lazy { |i| INT( 0 ) }
# Lambda(Variable(INT),INT(3))
l1[ 2 ]
# 3
l2 = lazy { |i| i }
l2[ 4 ]
# 4
