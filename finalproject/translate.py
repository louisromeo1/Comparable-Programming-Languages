from utility import *
from scanner import scan_from_file

def translator(emojis, filename):
    f = open(filename.split(".")[0] + ".py", "w")

    f.write("def xor(a,b):\n    if a and b:\n       return False\n    return a or b\n\n")

    indent_buffer = ""
    for i in range(len(emojis)):
        output_line = ""
        paren = False
        colon = False
        is_string = False
        f.write(indent_buffer)
        j = 0
        while j < len(emojis[i]):
            emoji_str = emojis[i][j].emoji
            if is_string and emoji_str not in string_keywords:
                output_line += "\""
                is_string = False
            if emoji_str == "point_right":
                indent_buffer += "    "
            elif emoji_str == "point_left":
                if indent_buffer != "":
                    indent_buffer = indent_buffer[:-4]
                else:
                    raise Exception("Too many :point_right:'s (closing bracket)")
            elif emoji_str in keywords:
                if (emoji_str not in ["1234", "abcd", "question", "hole"]):
                    output_line += keywords[emoji_str] + " "
            elif emoji_str in monoline:
                if emoji_str == "cook":
                    output_line += monoline[emoji_str] + " "
                    colon = True
                elif emoji_str == "herb":
                    paren = True
                    colon = True
                    output_line += monoline[emoji_str] + "( "
                elif emoji_str == "printer":
                    paren = True
                    output_line += monoline[emoji_str] + "( "
                elif emoji_str == "mailbox_with_mail":
                    output_line += monoline[emoji_str] + " "
                elif emoji_str == "index_pointing_at_the_viewer":
                    if emojis[i][j-1].emoji == "1234":
                        output_line += "float(" + monoline[emoji_str] + ")"
                    else:
                        output_line += monoline[emoji_str]
                else:
                    output_line += monoline[emoji_str]
            elif emoji_str in operators:
                if emoji_str == "heavy_equals_sign":
                    if emojis[i][j-1].emoji not in ["><"] and emojis[i][j+1].emoji not in ["><"]:
                        output_line += operators[emoji_str] + operators[emoji_str] + " " # Double equals
                    else:
                        output_line += operators[emoji_str] + " "
                elif emoji_str != "crossed_swords":
                    output_line += operators[emoji_str] + " "
                else: 
                    if j+2 > len(emojis[i]):
                        raise Exception("Illegal XOR call")
                    output_line += "xor(" + emojis[i][j+1].emoji + "," + emojis[i][j+2].emoji + ") "
                    j += 2
            elif emoji_str in digit_keywords:
                output_line += digit_keywords[emoji_str]
            elif emoji_str in string_keywords:
                if not is_string:
                    output_line += "\""
                    is_string = True
                output_line += string_keywords[emoji_str]
            elif emoji_str in other_keywords:
                if emoji_str == "repeat":
                    output_line += "while " # Can also potentially add for loop here
                    colon = True
                elif emoji_str == "comet":
                    output_line += ", "
                elif emoji_str == "rightwards_pushing_hand":
                    output_line += "("
                elif emoji_str == "leftwards_pushing_hand":
                    output_line += ")"
                elif emoji_str == "incoming_envelope":
                    paren = True
                    output_line += "("
            elif emoji_str in arithmetic:
                output_line += arithmetic[emoji_str] + " "
            elif emoji_str == "mailbox_with_mail":
                output_line += "return "
            else:
                output_line += emoji_str + " "
            j += 1
        if is_string:
            output_line += "\""
        if paren:
            output_line += ")"
        if colon:
            output_line += ":"
        f.write(output_line.strip() + "\n")
    if indent_buffer != "": # They have open something somewhere
        raise Exception("You have too many open blocks")