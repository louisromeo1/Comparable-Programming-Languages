def xor(a,b):
    if a and b:
       return False
    return a or b

arizona = float(input())
boston = float(input())


max_num = 0
if( arizona < boston ):
    max_num = boston
    print( boston )
    
else:
    print( arizona )
    


south = arizona + boston
print( south )



denver = arizona - boston
print( denver )


penn = arizona * boston
print( penn )














