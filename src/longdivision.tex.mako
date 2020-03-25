<%!
  import numpy
%>
<%def name="long_division(divisor, dividend)">\(${divisor}\showdiv{${dividend}}\)
</%def>

<%def name="long_division_solution(divisor, dividend)"><%
  result = dividend//divisor
  remainder = dividend%divisor
  divisorpool = [int(d) for d in str(dividend)]
  padding = '0' * (len(str(remainder))+1)
  register = 0
  while register < divisor:
    register = register * 10 + divisorpool.pop(0)
%>
\setstackgap{S}{1.5pt}
\stackMath\def\stackalignment{r}\(
\stackunder{${divisor} \stackon[1pt]{\showdiv{${dividend}\ph{${padding}}}}{${f'{result}r{remainder}'}}}{
  \Shortstack[l]{
% while divisorpool:
<%
  subtractor = 0
  while register - subtractor >= divisor:
    subtractor += divisor
  shift = len(str(register)) - len(str(subtractor))
  register = (register - subtractor) * 10 + divisorpool.pop(0)
%> {\ph{${'0' * (len(str(dividend))-len(divisorpool)-len(str(subtractor))-1-shift)}}\underline{\ph{${'0' * shift}}${subtractor}}} \ph{${'0' * (len(str(dividend))-len(divisorpool)-len(str(register)))}}${register}
% endwhile
<%
  subtractor = 0
  while register - subtractor >= divisor:
    subtractor += divisor
  shift = len(str(register)) - len(str(subtractor))
%> {\ph{${'0' * (len(str(dividend))-len(divisorpool)-len(str(subtractor))-shift)}}\underline{\ph{${'0' * shift}}${subtractor}}} \ph{${'0' * (len(str(dividend))-len(divisorpool)-len(str(remainder)))}}${remainder}\ph{${'0' * (len(str(remainder))+1)}}
}
}\)
</%def>

<%
  numpy.random.seed(SEED)
  num_problems = 20
  max_divisor = 100
  max_dividend = 10000
  problems = numpy.column_stack((
    numpy.random.randint(max_divisor + 1, size=num_problems+1),
    numpy.random.randint(max_dividend + 1, size=num_problems+1)))
%>

\textbf{Directions: } Evaluate the following long division problems with remainder notation.

\begin{exampleitemize}
\item[Example:] ${long_division_solution(*problems[0])}
\end{exampleitemize}

\begin{divitemize}
%for problem in problems[1:]:
\item ${long_division(*problem)}
%endfor
\end{divitemize}
\vfill
\clearpage

\begin{divsolitemize}
%for problem in problems[1:]:
\item ${long_division_solution(*problem)}
%endfor
\end{divsolitemize}
