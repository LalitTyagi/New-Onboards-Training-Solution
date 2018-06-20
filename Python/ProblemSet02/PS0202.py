def is_power(a, b):
    if a < b: 
        return False 
    if a == b:  
        return True  
    else:
        return is_power(a / b, b) 
    
x = int(input())
y = int(input())
    
print(is_power(x,y))
