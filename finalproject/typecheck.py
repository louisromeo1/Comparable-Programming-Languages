"""
File: typecheck.py
Author: Anthony Hsu
Purpose: Takes a list of tokens and a symbol table and checks if arithmetic operations are done correctly with respect
         to typing
Course: CSC 372
"""

from utility import *
booleans = ["white_check_mark", "x"]

def typecheck(emojis, symbol_table):
    """
    Does simple type checking for arithmetic operators and xor
    Args:
        emojis is a 2D list of tokens
        symbol_table is a dictionary of symbols
    Returns:
        Returns a 2D list of tokens
    """
    for i in range(len(emojis)):
        j = 0
        while j < len(emojis[i]):
            emoji_str = emojis[i][j].emoji
            if emoji_str in arithmetic:
                if j+2 > len(emojis[i]):
                    raise Exception("Not enough arguments for " + emojis[i][j].emoji)
                left = emojis[i][j-1].emoji
                right = emojis[i][j+1].emoji
                left_type = None
                if left in symbol_table:
                    if (symbol_table[left].get_type() == "1234"):
                        left_type = symbol_table[left].get_type()
                    elif symbol_table[left].get_type() == "abcd":
                        if emoji_str != "heavy_plus_sign":
                            raise Exception("Typecheck: Illegal left type for " + emojis[i][j].emoji)
                        left_type = symbol_table[left].get_type()
                    else:
                        raise Exception("Typecheck: Illegal left type for " + emojis[i][j].emoji)
                else:
                    if left in digit_keywords:
                        left_type = "1234"
                    elif left in abcd_keywords:
                        if emoji_str != "heavy_plus_sign":
                            raise Exception("Typecheck: Illegal left type for " + emojis[i][j].emoji)
                        left_type = "abcd"
                    else:
                        raise Exception("Typecheck: Illegal left type for " + emojis[i][j].emoji)

                if right in symbol_table:
                    if (symbol_table[right].get_type() != left_type):
                        raise Exception("Typecheck: Types do not match up for " + emojis[i][j].emoji)
                else:
                    if right in digit_keywords:
                        pass
                    elif right in abcd_keywords:
                        if emoji_str != "heavy_plus_sign" or left_type != "abcd":
                            raise Exception("Typecheck: Illegal right type for " + emojis[i][j].emoji)
                    else:
                        raise Exception("Typecheck: Illegal right type for " + emojis[i][j].emoji)
                j += 2
            elif emoji_str == "crossed_swords":
                left = emojis[i][j-1].emoji 
                right = emojis[i][j+1].emoji 

                if left not in booleans:
                    if left not in symbol_table:
                        raise Exception("Typecheck: Use of " + emojis[i][j-1].emoji + " before assignment")
                    if symbol_table[left].get_type() != "question":
                        raise Exception("Typecheck: Illegal left type for " + emojis[i][j].emoji)

                if right not in booleans:
                    if right not in symbol_table:
                        raise Exception("Typecheck: Use of " + emojis[i][j+1].emoji + " before assignment")
                    if symbol_table[right].get_type() != "question":
                        raise Exception("Typecheck: Illegal right type for " + emojis[i][j].emoji)

                emojis[i][j-1], emojis[i][j], emojis[i][j+1] = emojis[i][j], emojis[i][j-1], emojis[i][j+1]
                j += 2
            else:
                j += 1
    return emojis