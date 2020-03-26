<%!
  import numpy
%>
<%def name="long_multiplcation(top, bottom)">\(\Shortstack[r]{${top} \underline{\times \ph{${'0' * (len(str(top))-len(str(bottom)))}}${bottom}}}\)
</%def>

<%def name="long_multiplcation_solution(top, bottom)"> \(
\Shortstack[r]{${top}
\underline{\times \ph{${'0' * (len(str(top))-len(str(bottom)))}}${bottom}}
%for level, n in enumerate(reversed([int(i) for i in str(bottom)])):
<%
  maxwidth = len(str(n*top)) + level
  if (level>0) and (level==len(str(bottom))-1):
    start=r'\underline{+'
    end='}'
  else:
    start=''
    end=''
%>${start}${n*top}\mathbf{${'0'*level}}${end}
%endfor
%if len(str(bottom))>1:
${top*bottom}
%endif
}\)
</%def>

<%
  num_problems = 20
  max_top = 1000
  max_bottom = 1000
  numpy.random.seed(SEED)
  stream1 = numpy.random.randint(2, max_top + 1, size=num_problems+1)
  numpy.random.seed(SEED + 1)
  stream2 = numpy.random.randint(max_bottom + 1, size=num_problems+1)
  problems = numpy.column_stack((stream1, stream2))
%>

\textbf{Directions: } Evaluate the following long multiplcation problems.

\begin{exampleitemize}
\item[Example:] ${long_multiplcation_solution(*problems[0])}
\end{exampleitemize}

\begin{mulitemize}
%for problem in problems[1:]:
\item ${long_multiplcation(max(problem), min(problem))}
%endfor
\end{mulitemize}
\vfill
\clearpage

\begin{mulsolitemize}
%for problem in problems[1:]:
\item ${long_multiplcation_solution(max(problem), min(problem))}
%endfor
\end{mulsolitemize}
