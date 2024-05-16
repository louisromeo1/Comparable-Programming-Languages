from utility import *
from scanner import *
from typecheck import *
from translate import *
from syntax_checker import *

def main():
    filename = "test/function_error.txt" #input("Give filename of emoji program: \n")
    if (filename.strip().split(".")[1] != "txt"):
        raise Exception("Invalid Emoji File. Needs txt")
    try:
        f = open(filename, "r")
        f.close()
    except:
        raise Exception("File Not Found")

    emojis = scan_from_file(filename)
    symbol_table = syntax_checker(emojis)
    emojis = typecheck(emojis, symbol_table)
    translator(emojis, filename)
    
main()