def find_blocks(user_code, blocks):
    for line in user_code:
        if "incoming_envelope" in line:
            blocks.append("Function Start")
        if "mailbox_with_mail" in line:
            blocks.append("Function End")
        if "point_right" in line:
            blocks.append("Block Start")
        if "point_left" in line:
            blocks.append("Block End")
        else:
            blocks.append("Ignore")
    
def check_blocks(block_identifiers):
    num_function_starts = block_identifiers.count("Function Start")
    num_function_ends = block_identifiers.count("Function End")
    num_block_starts = block_identifiers.count("Block Start")
    num_block_ends = block_identifiers.count("Block End")

    if num_function_starts > num_function_ends:
        print("ERROR: Missing Function Closer")
        return False
    elif num_function_starts < num_function_ends:
        print("ERROR: Missing Function Starter")
        return False
    if num_block_starts > num_block_ends:
        print("ERROR: Missing Block Closer")
        return False
    elif num_block_starts < num_block_ends:
        print("ERROR: Missing Block Starter")
        return False
    return True