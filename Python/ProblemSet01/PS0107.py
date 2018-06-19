x=input("Enter 1st string.:")  
y=input("Enter 2nd string.:")  

def isIn(x,y):  
    if (x in y) or (y in x):  
       return True  
    else:   
        return False  

print(isIn(x,y))
