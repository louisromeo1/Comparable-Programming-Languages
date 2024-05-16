import emoji_variables
def check_syntax(line, symbols):
    if line[1] == "point_right":
        print("ERROR: Missing While-Loop Condition.")
        return False
    loop_start = line.index("point_right")
    if loop_start == -1:
        print("ERROR: Missing Starting Loop Statement.")
        return False
    conditions_list = line[1:loop_start]
    for condition in conditions_list:
        if not emoji_variables.is_valid_sequence(condition):
            print("ERROR: Invalid Branch Condition Input.")
            return False
    if emoji_variables.is_boolean(condition, symbols):
        print("ERROR: Branch Input Must Be Conditional.")
        return False
    return True
