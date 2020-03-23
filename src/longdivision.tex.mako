<%
  divisor = 10345356
  dividend = 500
  result = divisor//dividend
  remainder = divisor%dividend
  divisorpool = [int(d) for d in str(divisor)]
  padding = '0' * (len(str(remainder))+1)
  register = 0
  while register < dividend:
    register = register * 10 + divisorpool.pop(0)
%>
\setstackgap{S}{1.5pt}
\stackMath\def\stackalignment{r}\(
\stackunder{${dividend} \stackon[1pt]{\showdiv{${divisor}\ph{${padding}}}}{${f'{result}r{remainder}'}}}{
  \Shortstack[l]{
% while divisorpool:
<%
  subtractor = 0
  while register - subtractor >= dividend:
    subtractor += dividend
  shift = len(str(register)) - len(str(subtractor))
  register = (register - subtractor) * 10 + divisorpool.pop(0)
%> {\ph{${'0' * (len(str(divisor))-len(divisorpool)-len(str(subtractor))-1-shift)}}\underline{\ph{${'0' * shift}}${subtractor}}} \ph{${'0' * (len(str(divisor))-len(divisorpool)-len(str(register)))}}${register}
% endwhile
<%
  subtractor = 0
  while register - subtractor >= dividend:
    subtractor += dividend
  shift = len(str(register)) - len(str(subtractor))
%> {\ph{${'0' * (len(str(divisor))-len(divisorpool)-len(str(subtractor))-shift)}}\underline{\ph{${'0' * shift}}${subtractor}}} \ph{${'0' * (len(str(divisor))-len(divisorpool)-len(str(remainder)))}}${remainder}\ph{${'0' * (len(str(remainder))+1)}}
}
}\)
