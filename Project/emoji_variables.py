from utility import * 

valid_numbers = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "radio_button", "thermometer_face"]
valid_letters = ["regional_indicator_a", "regional_indicator_b", "regional_indicator_c", "regional_indicator_d", "regional_indicator_e", "regional_indicator_f", "regional_indicator_g", "regional_indicator_h", "regional_indicator_i", "regional_indicator_j", "regional_indicator_k", "regional_indicator_l", "regional_indicator_m", "regional_indicator_n", "regional_indicator_o", "regional_indicator_p", "regional_indicator_q", "regional_indicator_r", "regional_indicator_s", "regional_indicator_t", "regional_indicator_u", "regional_indicator_v", "regional_indicator_w", "regional_indicator_x", "regional_indicator_y", "regional_indicator_z"]
valid_punctuation = ["grey_exclamation", "nail_care", "grey_question", "blue_square"]
valid_booleans = ["x", "white_check_mark"]

whitelisted = set((monoline | keywords | operators | arithmetic).keys()).union(other_keywords) - set(valid_booleans)

class Variable:
    def __init__(self, variable_name):
        self.type = None
        self.name = variable_name
        self.value = None
    def set_type(self, data_type):
        self.type = data_type
    def set_value(self, variable_value):
        self.value = variable_value
    def get_name(self):
        return self.name
    def get_type(self):
        return self.type
    def get_value(self):
        return self.value

def is_number(emoji_variable, symbol_table):
    if isinstance(emoji_variable, Variable):
        return emoji_variable.get_type() == "1234"
    for emoji in emoji_variable:
        if emoji in symbol_table.keys():
            if symbol_table[emoji].get_type() != "1234":
                return False
        elif emoji not in valid_numbers:
            return False
    return True

def is_string(emoji_variable, symbol_table):
    if isinstance(emoji_variable, Variable):
        return emoji_variable.get_type() == "abcd"

    for emoji in emoji_variable:
        if emoji in symbol_table.keys():
            if symbol_table[emoji].get_type() != "abcd":
                return False
        elif emoji not in valid_letters and emoji not in valid_punctuation:
            return False
    return True

def is_boolean(emoji_variable, symbol_table):
    if isinstance(emoji_variable, Variable):
        return emoji_variable.get_type() == "question"

    for emoji in emoji_variable:
        if emoji in operators:
            return True
        if emoji in symbol_table.keys():
            if symbol_table[emoji].get_type() == "question":
                return True
    return False
    
def check_type(emoji_contents, symbol_table):
    out_type = ""
    for i in set(operators.keys())-set(valid_booleans):
        if i in emoji_contents:
            return "question"
    for emoji in emoji_contents:
        if emoji not in whitelisted:
            if out_type == "":
                if is_number([emoji], symbol_table):
                    out_type = "1234"
                elif is_string([emoji],symbol_table):
                    out_type = "abcd"
                elif is_boolean([emoji], symbol_table):
                    out_type = "question"
                else:
                    out_type = "invalid"
            else:
                if is_number([emoji], symbol_table) and out_type == "1234":
                    out_type = "1234"
                elif is_string([emoji],symbol_table) and out_type == "abcd":
                    out_type = "abcd"
                elif is_boolean([emoji], symbol_table) and out_type == "question":
                    out_type = "question"
                else:
                    raise Exception("Conflicting types for Checking variables!")
    return out_type
    
def is_valid_sequence(emoji_sequence):
    if not is_valid_emoji(emoji_sequence):
        return False
    return True

def is_valid_emoji(emoji_name):
    if len(emoji_name) < 1:
        return False
    if len(emoji_name) == 1 and emoji_name == "_":
        return False
    for character in emoji_name:
        if not character.isalnum() and not character == "_":
            return False
    return True