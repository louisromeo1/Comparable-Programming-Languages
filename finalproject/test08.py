from translate import *
from scanner import *
from typecheck import *
from syntax_checker import *

print("Testing input and print")

emojis = scan_from_file("test/input_print_test.txt")
symbol_table = syntax_checker(emojis)
emojis = typecheck(emojis, symbol_table)
translator(emojis, "input_print.txt")

print("check input_print.py")