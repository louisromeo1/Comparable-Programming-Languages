from scanner import *
print("Testing simple scan")

emojis = scan_from_file("test/simple_scan_test.txt")
print("Expected: [[:hellobanana:, :cook:, :ohno:], [:hehedonkeyblah:], [:jollyhousdf:], [:onion:]]")
print("Actual:  ", emojis)