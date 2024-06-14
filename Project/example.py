from scanner import scan_from_file

print(scan_from_file("test/simple_scan_test.txt")) # This should do print a list of "Emojis"

print(scan_from_file("test/scan_error_test.txt")) # This should throw an error