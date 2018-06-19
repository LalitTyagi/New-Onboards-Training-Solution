## ProblemSet02

1. The greatest common divisor (GCD) of a and b is the largest number that divides
both of them with no remainder.
One way to find the GCD of two numbers is based on the observation that if r is the remainder when
a is divided by b, then gcd(a, b) = gcd(b, r). As a base case, we can use gcd(a, 0) = a. 
Write a function called gcd that takes parameters a and b and returns their greatest common divisor.

2. A number, a, is a power of b if it is divisible by b and a/b is a power of b. Write a
function called is_power that takes parameters a and b and returns True if a is a power of b. Note:
you will have to think about the base case.

3. Observe the following function definitions. They Calculate the Factorial as per the Mathematical
definition 1! = 1
		  (n + 1)! = (n + 1) * n!
Implement factI(n) as an Iterative Implementation & factR(n) as a Recursive Implementation
```python
def factI(n):
	"""Assumes that n is an int > 0
	Returns n!
	Uses Iterative Implementation"""
	
def factR(n):
	"""Assumes that n is an int > 0
	Returns n!
	Uses Recursive Implementation"""
```

4. Write a program that computes the decimal equivalent of the binary number
10011?

5. Implement a function that meets the specification below. Use a try-except block.
```python
def sumDigits(s):
	"""Assumes s is a string
	Returns the sum of the decimal digits in s
	For example, if s is 'a2b3c' it returns 5"""
```

6. Implement a function that satisfies the specification. Use a try-except block.
```python
def findAnEven(l):
	"""Assumes l is a list of integers
	Returns the first even number in l
	Raises ValueError if l does not contain an even number"""
```

7. A palindrome is a word that is spelled the same backward and forward, like "Malayalam"
and "Noon" . Recursively, a word is a palindrome if the first and last letters are the same and the
middle is a palindrome.
Write a function called is_palindrome that takes a string argument and returns True if it
is a palindrome and False otherwise. Remember that you can use the built-in function len
to check the length of a string.  
Use the function definition 
```python
def isPalindrome(s):
	"""Assumes s is a str
	Returns True if s is a palindrome; False otherwise.
	Punctuation marks, blanks, and capitalization are
	ignored."""
```
Ensure you build a test function testIsPalindrome() that tests your palindrome function.

8. The built-in function eval takes a string and evaluates it using the Python interpreter.
For example:
```python
>>> eval('1 + 2 * 3')
7
>>> import math
>>> eval('math.sqrt(5)')
2.2360679774997898
>>> eval('type(math.pi)')
<type 'float'>
```
Write a function called eval_loop that iteratively prompts the user, takes the resulting input and
evaluates it using eval, and prints the result.
It should continue until the user enters 'done', and then return the value of the last expression it
evaluated.

9. One way of computing square roots is Newton’s method. Suppose that you
want to know the square root of a. If you start with almost any estimate, x, you can compute
a better estimate with the following formula:
y = (x + a/x)/2 For example, if a is 4 and x is 3:

```python
>>> a = 4.0
>>> x = 3.0
>>> y = (x + a/x) / 2
>>> print y
2.16666666667
````

a) Write a function NewtonSqrt() to abstract the Newton's Method of calculation Square roots.

b) Write a function named test_square_root that prints a table like this:

        Number |  NewtonSqrt  |    math.sqr  | Difference 
        -------|--------------|--------------|------------------
		1.0|           1.0|           1.0|               0.0 
		2.0| 1.41421356237|1.41421356237 | 2.22044604925e-16
		3.0| 1.73205080757|1.73205080757 |               0.0
		4.0|           2.0|           2.0|               0.0
		5.0| 2.2360679775 |  2.2360679775|               0.0
		6.0| 2.44948974278| 2.44948974278|               0.0
		7.0| 2.64575131106| 2.64575131106|               0.0
		8.0| 2.82842712475| 2.82842712475|  4.4408920985e-16
		9.0|           3.0|           3.0|               0.0

The first column is a number, a; the second column is the square root of a computed with the function
NewtonSqrt(); the third column is the square root computed by math.sqrt; the fourth column is
the absolute value of the difference between the two estimates 
