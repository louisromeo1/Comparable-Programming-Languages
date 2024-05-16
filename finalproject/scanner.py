"""
File: scanner.py
Author: Anthony Hsu and Rachel Whitaker
Purpose: Scans input for Emoji Language Tokens and saves them into tokens list
Course: CSC 372
"""

from utility import *

def scan_from_file(filename):
    """
    Scans a file for emojis and turns them into tokens
    Args:
        filename is a string representing a filename
    Returns:
        Returns a 2D list of tokens
    """
    f = open(filename, "r")
    emojis = []
    line_num = 1
    in_block = False    # Tracking block comments
    for line in f:
        parsed_line = []
        ns_line = "".join(line.split()) # Don't care about whitespace
        temp_string = ""
        temp_var_string = ""
        started = False
        for i in range(len(ns_line)):
            char = ns_line[i]
            if (char == ":" and started): # started is true
                started = False 

                temp_string = temp_string.lower()

                # checking for comments
                if temp_string == "speech_left":
                    break
                elif temp_string == "loud_sound" and not in_block:
                    in_block = True
                elif temp_string == "loud_sound" and in_block:
                    in_block = False
                else:
                    if not in_block:
                        if temp_string not in all_keywords:
                            temp_var_string += temp_string
                        else:
                            if temp_var_string != "":
                                emoji = EmojiToken(temp_var_string) # Handles adding variable
                                parsed_line.append(emoji)
                                temp_var_string = ""
                            emoji = EmojiToken(temp_string) # Handles adding the keyword
                            parsed_line.append(emoji)
                        if i == len(ns_line)-1:
                            if temp_var_string != "":
                                emoji = EmojiToken(temp_var_string) # Handles adding variable at end of line
                                parsed_line.append(emoji)
                                temp_var_string = ""
                temp_string = ""
            elif (char == ":" and not started): # started is false
                started = True
            elif (char != ":" and not started): # started is false
                if not in_block: # This means its not part of an emoji
                    raise Exception("Scanner: Invalid emojis/characters found in line", line_num)
            else: # started is true and char not :
                temp_string += char
        emojis.append(parsed_line)
        line_num += 1
    f.close()
    return emojis