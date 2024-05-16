class EmojiToken:
    emoji: str
    def __init__(self, emoji):
        self.emoji = emoji

    def __repr__(self):
        return f":{self.emoji}:"

    def __str__(self):
        return f":{self.emoji}:"

# Does not check for point_right or point_left
# Does not check for repeat

other_keywords = set(["point_left", "point_right", "rightwards_pushing_hand", "leftwards_pushing_hand", "incoming_envelope", "repeat", "comet"])

string_keywords = {
    "regional_indicator_a": "a",
    "regional_indicator_b": "b",
    "regional_indicator_c": "c",
    "regional_indicator_d": "d",
    "regional_indicator_e": "e",
    "regional_indicator_f": "f",
    "regional_indicator_g": "g",
    "regional_indicator_h": "h",
    "regional_indicator_i": "i",
    "regional_indicator_j": "j",
    "regional_indicator_k": "k",
    "regional_indicator_l": "l",
    "regional_indicator_m": "m",
    "regional_indicator_n": "n",
    "regional_indicator_o": "o",
    "regional_indicator_p": "p",
    "regional_indicator_q": "q",
    "regional_indicator_r": "r",
    "regional_indicator_s": "s",
    "regional_indicator_t": "t",
    "regional_indicator_u": "u",
    "regional_indicator_v": "v",
    "regional_indicator_w": "w",
    "regional_indicator_x": "x",
    "regional_indicator_y": "y",
    "regional_indicator_z": "z",
    "grey_exclamation" : "!",
    "nail_care": ",",
    "grey_question": "?",
    "blue_square": " "}
    
digit_keywords = {"zero": "0",
    "one": "1",
    "two": "2",
    "three": "3",
    "four": "4",
    "five": "5",
    "six": "6",
    "seven": "7",
    "eight": "8",
    "nine": "9",
    "radio_button": ".", # May need to implement interesting logic for this
    }

operators = {
    "x": "False",
    "white_check_mark": "True",
    "twisted_rightwards_arrows": "or",
    "crossed_swords": "xor", # We will force them to use two expressions on either side of xor
    "handshake": "and", # May need to add parenthesis or something...idk
    "mouse": "<",
    "heavy_equals_sign": "=",
    "elephant": ">",
}

arithmetic = {
    "heavy_plus_sign": "+",
    "heavy_minus_sign": "-",
    "heavy_multiplication_x": "*",
    "heavy_division_sign": "/",
    "scissors" : "%"
}

keywords = {
    "1234": "int",
    "thermometer_face": "-",
    "abcd": "string",
    "question": "bool",
    "hole": "void",
    "person_gesturing_no": "not",
    "point_up": "(",
    "point_down": ")",
    "palm_up_hand": "=",
    "broken_heart": "break"
}

monoline = {
    "cook" : "def",
    "herb": "if",
    "face_with_monocle": "else:",
    "palm_up_hand": "=",
    "printer": "print",
    "index_pointing_at_the_viewer": "input()",
    "mailbox_with_mail": "return"
}

all_keywords = set((monoline | keywords | operators | digit_keywords | string_keywords | arithmetic).keys()).union(other_keywords)


def xor(a,b):
    if a and b:
        return False
    return a or b