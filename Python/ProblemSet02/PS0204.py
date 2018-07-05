def decimal(num):
    dec,i = 0,0;
    while(num!=0):
        temp = num%10
        dec = dec + temp*pow(2,i)
        num=num//10
        i+=1
    
    return dec;  

num = int(input())
print(decimal(num))
