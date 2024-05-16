from translate import *
from scanner import *

print("Testing input and print")

emojis = scan_from_file("test/input_print_test.txt")
translator(emojis, "input_print.txt")

print("check input_print.py")