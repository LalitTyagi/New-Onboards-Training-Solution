def gcd(a, b):
    if b == 0:
        return a
    r = a % b
    return gcd(b, r)
    
num1 = int(input())
num2 = int(input())

if(num1>num2):
    x = num1
    y = num2
else:
    x = num2
    y = num1
    
print(gcd(x,y))
