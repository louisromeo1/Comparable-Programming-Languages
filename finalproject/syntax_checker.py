import emoji_variables
import variable_assignment
import variable_reassignment
import branch_statements
import while_loops
import check_scoping
import printing
import function_declarations
import function_calls

symbol_table = {}
function_stack = []
block_locations = []
data_types = ["abcd", "1234", "question"]
number_operators = ["heavy_plus_sign", "heavy_minus_sign", "heavy_multiplication_x", "heavy_division_sign", "scissors", "point_up", "point_down"]
boolean_operators = ["handshake", "person_gesturing_no", "twisted_rightwards_arrows", "crossed_swords"]
comparison_operators = ["elephant", "mouse", "heavy_equals_sign"]

def syntax_checker(emojis):
    string_emojis = []
    for line in emojis:
        string_line = []
        for i in line:
            string_line.append(i.emoji)
        string_emojis.append(string_line)

    check_scoping.find_blocks(string_emojis, block_locations)
    current_line = 0
    for line in string_emojis:
        current_line += 1
        if len(line) != 0:
            is_valid = parse_line(line)
            if not is_valid:
                raise Exception("Error Located at Line " + str(current_line))
    
    if check_scoping.check_blocks(block_locations):
        print("Compilation Completed Successfully!")
        return symbol_table
       
    return None

def parse_line(line):
    if line[0] in data_types:
        if len(line) == 1 or len(line) == 3:
            print('ERROR: Variable Assignment Should Follow the Format "{Data Type} {Variable Name}" or "{Data Type} {Variable Name} :palm_up_hand: {Variable Value}".')
            return False
        else:
            return variable_assignment.check_syntax(line, symbol_table)
    elif line[0] == "cook":
        return function_declarations.check_syntax(line, symbol_table, function_stack)      
    elif line[0] == "herb":
        return branch_statements.check_syntax(line, symbol_table, "if")
    elif line[0] == "face_with_monocle":
        return branch_statements.check_syntax(line, symbol_table, "else")
    elif line[0] == "repeat":
        return while_loops.check_syntax(line, symbol_table)
    elif line[0] in symbol_table.keys():
        return variable_reassignment.check_syntax(line, symbol_table)
    elif line[0] == "index_pointing_at_the_viewer":
        if len(line) > 1:
            print("ERROR: Input must be alone on its line")
            return False
        return True
    elif line[0] == "printer":
        return printing.check_syntax(line, symbol_table)
    elif line[0] == "broken_heart":
        return len(line) == 1
    elif line[0] == "mailbox_with_mail":
        return function_declarations.check_syntax(line, symbol_table, function_stack)
    elif line[0] in ["point_right", "point_left"]:
        return len(line) == 1
    else:
        print("ERROR: Unrecognized Keyword.")
        return False