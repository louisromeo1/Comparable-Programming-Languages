import emoji_variables

def check_syntax(line, symbols):
    if len(line) > 1:
        print_inputs = line[1:]
        for print_input in print_inputs:
            if not emoji_variables.is_valid_sequence(print_input):
                print("ERROR: Invalid Printer Input.")
                return False
    return True