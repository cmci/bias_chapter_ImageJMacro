import fileinput
import re

f = 'mod2all.tex'
lines  = [line.rstrip('\n') for line in open(f)]
out =  ''
for ll in lines:
    matched = re.match(r"(.*)\\lstinputlisting(\[.*\])?{(code\/.*\.ijm)}", ll)
    if matched:
        # print matched.group()
        pref = matched.group(1)
        options = matched.group(2)
        contents = matched.group(3)
        print contents
        codef = open(contents, 'r')
        codedata = codef.read()

        if not options:
            options = ''
        newtext = pref + '\n' \
                '\\begin{lstlisting}' + options + '\n' + \
                codedata + '\n' + \
                '\\end{lstlisting}' + '\n' \
                '(' + contents + ')'
        # print newtext
        out = out + newtext + '\n'

    else:
        out = out + ll + '\n'

print out
f2 = open('testout.tex', 'w')
f2.write(out)
f2.close()

