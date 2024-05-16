from scanner import *
print("Testing inline comments")
emojis = scan_from_file("test/inline_comments_test.txt")
print("Expected: [[:hellobananaohno:], [:hehedonkeyblah:], [], [:onion:]]")
print("Actual:  ", emojis)
