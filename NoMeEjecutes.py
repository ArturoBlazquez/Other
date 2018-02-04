#Programa que cuando lo ejecutas se autodestrute
import os, sys

os.remove(sys.argv[0])

print "Este programa ha sido autodestruido"
