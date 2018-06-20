"""Assumes that n is an int > 0
	Returns n!
	Uses Iterative Implementation"""  
def factI(n):
    fact=1
    while(n>0):
        fact=fact*n
        n=n-1
    return fact

"""Assumes that n is an int > 0
	Returns n!
	Uses Recursive Implementation"""
def factR(n):
    if(n <= 1):
        return 1
    else:
        return(n*factR(n-1))

n=int(input("Enter number:"))
print("Factorial of the number Using Iterative Implementation is: ")
print(factI(n))
print("Factorial of the number Using Recursive Implementation is: ")
print(factR(n))
