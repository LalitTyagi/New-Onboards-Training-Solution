import math
num = int(input())

for power in range(1,6):
    a = (num ** (1.0/power))
    if math.ceil(a) == a:
        print (a, power)
