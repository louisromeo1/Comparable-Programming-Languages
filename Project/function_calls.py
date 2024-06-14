import emoji_variables
def check_syntax(line, symbols, return_types):
    if line[0] not in symbols.keys():
        print("ERROR: Couldn't Find Function in Symbol Table")
        return False
    start_call = line.index("incoming_envelope")
    if start_call == -1:
        print("ERROR: Missing Function Call Signifier")
        return False
    function_inputs = line[1:start_call]
    for input in function_inputs:
        if not emoji_variables.is_valid_sequence(input):
            print("ERROR: Invalid Function Call Inputs.")
            return False
    return True