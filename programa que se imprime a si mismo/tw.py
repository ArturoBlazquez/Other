#Programa que se imprime a si mismo, idea para hacer un bot de tw

import sys

lines=open(sys.argv[0]).readlines()

actual=int(lines[-1])

print lines[actual]

next=(actual+1)%len(lines)

lines[-1]=str(next)+'\n'

open(sys.argv[0],'w').writelines(lines)

1
