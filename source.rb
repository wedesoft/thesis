#!/usr/bin/env ruby
output = File.new ARGV[ 0 ], 'w'
lang = ARGV[ 1 ]
prefix = ARGV[ 2 ]
files = ARGV[ 3 .. -1 ].sort
files.each do |s|
  base = s[ prefix.size .. -1 ]
  sec_name = base.gsub '_', '\_'
  cha_name = base.tr '/._', '-'
  output.write <<EOS
\\subsection{#{sec_name}}\\label{cha:#{cha_name}}
\\lstset{language=#{lang},frame=single,basicstyle=\\ttfamily\\bfseries\\color{codegray}\\scriptsize}
\\begin{lstlisting}
EOS
  c = 0
  multiline = false
  File.new( s, 'r' ).readlines.each do |l|
    if lang == 'Ruby'
      comment = l =~ /^\ *(#.*)?$/
    else
      comment = l =~ /^\ *(\/\/.*)?$/
      multiline = true if l =~ /^\ *\/\*.*$/
    end
    unless comment or multiline
      output.write l
      c += 1
    end
    multiline = false if l =~ /^.*\*\/\ *$/
  end
  output.write <<EOS
\\end{lstlisting}
EOS
end

