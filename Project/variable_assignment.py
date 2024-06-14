import emoji_variables
def check_syntax(line, symbols):
    data_type = line[0]
    variable_name = line[1]
    if variable_name in symbols.keys() and symbols[variable_name].get_type() != data_type:
        print("ERROR: Variable of a Different Type Already Exists.")
        return False
    if emoji_variables.is_valid_sequence(variable_name):
        new_variable = emoji_variables.Variable(variable_name)
    else:
        print("ERROR: Invalid Variable Name.")
        return False
       
    new_variable.set_type(data_type)
    if len(line) == 2:
        symbols[new_variable.get_name()] = new_variable
        return True
    else:
        if line[2] != "palm_up_hand":
            print("ERROR: Incorrect Assignment Operator.")
            return False
        variable_value = line[3:]
        for emoji in variable_value:
            if not emoji_variables.is_valid_sequence(emoji):
                print("ERROR: Invalid Variable Value.")
                return False
        assignment_passed = data_type == emoji_variables.check_type(variable_value, symbols)
        if data_type == "1234" and variable_value[-1] != "index_pointing_at_the_viewer":
            assignment_passed = assignment_passed and check_number_assignment(variable_value[0], new_variable)
            if not assignment_passed:
                print("ERROR: Invalid Number Value.")
                return False
        elif data_type == "abcd" and variable_value[-1] != "index_pointing_at_the_viewer":
            if not assignment_passed:
                print("ERROR: Invalid String Value.")
                return False
        elif data_type == "question":
            if not assignment_passed:
                print("ERROR: Invalid Boolean Value.")
                return False
        new_variable.set_value(variable_value)
        symbols[new_variable.get_name()] = new_variable
        return True
    
def check_number_assignment(number_val, new_variable):
    if "thermometer_face" in number_val and number_val[0] != "thermometer_face":
        print("ERROR: Negative Signs Should Be Beginning of Number")
        return False
    if "thermometer_face" in number_val and len(number_val) == 1:
        print("ERROR: Number Can't Contain Only Negative Signs")
        return False
    if "radio_button" in number_val and len(number_val) == 1:
        print("ERROR: Number Can't Contain Only Decimal Points")
        return False
    num_decimal_points = 0
    num_negative_signs = 0
    for place in number_val:
        if place == "radio_button":
            num_decimal_points += 1
        elif place == "thermometer_face":
            num_negative_signs += 1
    
    if num_negative_signs > 1:
        print("ERROR: 2+ Negative Signs")
        return False
    elif num_decimal_points > 1:
        print("ERROR: 2+ Decimal Points")
        return False
    return True