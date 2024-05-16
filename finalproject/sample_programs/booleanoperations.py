def xor(a,b):
    if a and b:
       return False
    return a or b

ironman = True
spiderman = False
batman = not ironman and spiderman
hulk = ironman and spiderman
catwoman = ironman or spiderman
