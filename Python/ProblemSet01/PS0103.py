#Write a program that asks the user to input 10 integers, and then prints the 

#largest odd number that was entered. If no odd number was entered, it should 

#print a message to that effect.



n=int(input())

arr = []
count=0;

for i in range(n):
    
	m=int(input())
    
	if(m%2==1):
        
	arr.append(m);
        
	count+=1


if(count>0):
    
	print(max(arr))
elif
	print("No Odd num.")
