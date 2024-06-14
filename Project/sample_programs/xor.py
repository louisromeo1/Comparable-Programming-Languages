def xor(a,b):
    if a and b:
       return False
    return a or b

hulk = True
banana = False

print( "xor")
print( xor(hulk,hulk) )
print( xor(banana,hulk) )
print( xor(hulk,banana) )
print( xor(banana,banana) )
