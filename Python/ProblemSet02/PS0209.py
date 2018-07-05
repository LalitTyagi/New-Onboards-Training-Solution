import math

def newtons(n):
    n = float(n)  
    x = n / 2  
    i = 0
    while i < 10:
        y = (x + n / x) / 2  
        x = y
        i += 1
    return y

print("Number |  NewtonSqrt  |    math.sqr  | Difference") 
print("-------|--------------|--------------|-----------")
for i in range(1, 10):
    n = newtons(i)
    l = math.sqrt(float(i))
    temp = abs(n - l)
    print(i,n,l,temp)
