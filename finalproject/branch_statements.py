import emoji_variables

def check_syntax(line, symbols, identifier):
    if identifier == "if":
        if line[1] == "point_right":
            print("ERROR: Missing Branch Condition.")
            return False
        branch_start = line.index("point_right")
        if (branch_start == -1):
            print("ERROR: Missing Starting Branch Statement.")
            return False
        conditions_list = line[1:]
        for condition in conditions_list:
            if not emoji_variables.is_valid_sequence(condition):
                print("ERROR: Invalid Branch Condition Input.")
                return False
        if not emoji_variables.is_boolean(conditions_list, symbols):
            print("ERROR: Branch Input Must Be Conditional.")
            return False
        return True
    else:
        if "point_right" not in line:
            print('ERROR: Else Statements Should Follow the Format ":face_with_monocle: :point_right: {Code Statements} :point_left:".')
            return False
        if len(line) > 2:
            print("ERROR: Else Branch Too Long.")        
            return False
        return True