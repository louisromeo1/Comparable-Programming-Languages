from typecheck import *
from scanner import *

class SimpleVariable:
    def __init__(self, dataType, variableName):
        self.dataType = dataType
        self.name = variableName
    
    def getType(self):
        return self.dataType

print("Testing type checker")

emojis = scan_from_file("test/typecheck_test.txt")
var = SimpleVariable("Number", emojis[0][0])
symboltable = {emojis[0][0].emoji: var}
typecheck(emojis, symboltable)

print("Type Check Successful")