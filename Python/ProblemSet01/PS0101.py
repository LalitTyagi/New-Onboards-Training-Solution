x = int(input().strip())
y = int(input().strip())
z = int(input().strip())

if(x%2==0):
    x=0;
if(y%2==0):
    y=0;
if(z%2==0):
    z=0;
    
if(x>y and x>z):
    print("X largest odd number");
elif(y>x and y>z):
    print("Y largest odd number");
elif(z>x and z>y):
    print("Z largest odd number");
else:
    print("None");
