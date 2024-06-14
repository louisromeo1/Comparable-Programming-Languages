from scanner import *
print("Testing block comments")
emojis = scan_from_file("test/block_comments_test.txt")
print("Expected: [[], [], [], [], [], [:boom:], [:bananacoconut:]]")
print("Actual:  ", emojis)