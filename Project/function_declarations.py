import emoji_variables
function_types = ["1234", "abcd", "question", "hole"]

def check_syntax(line, symbols, return_types):
    if line[0] == "mailbox_with_mail":
        if len(return_types) == 0:
            print("ERROR: Missing Original Function Declaration.")
            return False
        return_type = return_types[-1]

        if len(line) == 1:
            return return_type == "hole"

        returned_variable = line[1:]
        if emoji_variables.check_type(returned_variable, symbols) != return_type:
            print("ERROR: Function Must Return the Proper Type.")
            return False
        return True
    else: 
        if line[1] not in function_types:
            print("ERROR: Invalid Function Type.")
            return False

        return_types.append(line[1])
        function_name = line[2]
        if not emoji_variables.is_valid_sequence(function_name):
            print("ERROR: Invalid Function Name.")
            return False
        if function_name in symbols.keys():
            print("ERROR: Function Name Already Taken.")
            return False
        if line[3] != "rightwards_pushing_hand":
            print("ERROR: Missing rightwards_pushing_hand.")
            return False
        if line[len(line)-2] != "leftwards_pushing_hand":
            print("ERROR: Missing leftwards_pushing_hand.")
            return False
        if line[len(line)-1] != "point_right":
            print("ERROR: Missing point_right.")
            return False
        
        function_inputs = line[4:-2]
        i = 0
        param_count = 0
        while i < len(function_inputs): # handle Parameters
            if function_inputs[i] not in function_types:
                print("ERROR: Invalid Parameter Type.")
                return False
            if not emoji_variables.is_valid_sequence(function_inputs[i+1]):
                print("ERROR: Invalid Parameter.")
                return False
            new_variable = emoji_variables.Variable(function_inputs[i+1])
            new_variable.set_type(function_inputs[i])
            symbols[new_variable.get_name()] = new_variable
            i += 3
            param_count += 1
        new_variable = emoji_variables.Variable(line[2])
        new_variable.set_type(line[1])
        new_variable.set_value(param_count)
        symbols[new_variable.get_name()] = new_variable
        return True
