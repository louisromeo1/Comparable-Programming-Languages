
import emoji_variables
def check_syntax(line, symbols):
    variable_name = line[0]
    if line[1] != "palm_up_hand":
        print("ERROR: Incorrect Assignment Operator.")
        return False
    if variable_name not in symbols.keys():
        print("ERROR: Variable Name Doesn't Exist in Symbol Table")
    existing_type = symbols[variable_name].get_type()
    rest_of_line = line[2:]
    new_type = emoji_variables.check_type(rest_of_line, symbols)
    if existing_type != new_type:
        print("ERROR: Variable Must Be Of Type " + existing_type)
        return False
    return True