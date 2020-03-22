<%
  divisor = 10045
  dividend = 50
  result = divisor//dividend
  remainder = divisor%dividend
  divisorpool = [int(d) for d in str(divisor)]
  padding = '0' * (len(str(remainder))+1)
  register = 0
  lpad = 0
  while register < dividend:
    register = register * 10 + divisorpool.pop(0)
    lpad += 1
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
  register = (register - subtractor) * 10 + divisorpool.pop(0)
  lpad += 1
%> {\ph{${'0' * (lpad - 1)}}\underline{${subtractor}}} \ph{${'0' * lpad}}${register}
% endwhile
<%
  subtractor = 0
  while register - subtractor >= dividend:
    subtractor += dividend
%> {\ph{${'0' * lpad}}\underline{${subtractor}}} \ph{${'0' * (lpad + 1)}}${remainder}\ph{${padding}}
}
}\)
