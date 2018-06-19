## ProblemSet04

1. Define a class named Shape and its subclass Square. The Square class has an init function which takes a length as argument. 
Both classes have a area function which can print the area of the shape where Shape's area is 0 by default.

2. Define a class Person and its two child classes: Male and Female. 
All classes have a method "getGender" which can print "Male" for Male class and "Female" for Female class.

3. Design and implement a Money class that stores monetary values in dollars and cents. Special method
__init__ should have the following function header,
def __init__(self, dollars, cents)
Include special method __repr__ (__str__) for displaying values in dollars and cents: $ 0.45,
$ 1.00, $ 1.25. Also include special method __add__, and three getter methods that each provide the
monetary value in another currency. Choose any three currencies to convert to.

4. Write both a nonrecursive and recursive function that displays the rows of asterisks given below,

```
            **
	   ****
          ******
        **********
       ************
      **************
```

5. Consider the following code

```python

class Coordinate(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def getX(self):
        # Getter method for a Coordinate object's x coordinate.
        # Getter methods are better practice than just accessing an attribute directly
        return self.x

    def getY(self):
        # Getter method for a Coordinate object's y coordinate
        return self.y

    def __str__(self):
        return '<' + str(self.getX()) + ',' + str(self.getY()) + '>'
```
Your need to define the following two methods for the Coordinate class:

a) Add an __eq__ method that returns True if coordinates refer to same point in the plane (i.e., have the same x and y coordinate).

b) Define __repr__, a special method that returns a string that looks like a valid Python expression that could be used to recreate an object with the same value. In other words, eval(repr(c)) == c given the definition of __eq__ from part 1.
	
6. Develop an abstract class named Temperature that stores a single temperature. The class should have
the following function header for special method __init__,
	
```python

def __init__(self, temperature)
	'''The abstract class should contain the following methods:
	_str__ — should return a string of the form “75 degrees Fahrenheit”
	aboveFreezing() — returns True if temperature above the freezing point
	convertToFahren — returns a new Temperature object converted to degrees Fahrenheit
	convertToCelsius — returns a new Temperature object converted to degrees Celsius
	convertToKelvin — returns a new Temperature object converted to degrees Kelvin	
	'''
```	
Develop the subclasses Fahrenheit, Celsius and Kelvin to appropriately implement each of the methods in the abstract Temperature class. (Note that when a meaningless conversion method is applied, for example, temp1.convertToFahrenheit() where temp1 is an object of type
Fahrenheit, then a copy of the Temperature object should be returned.)

Demonstrate the correctness of your classes by doing the following:
1. Create a list of Temperature objects of a mix of Temperature types

2. Print out the value of each temperature in the list, and add “above freezing” if the temperature is above
freezing (for the specifi c temperature scale).

3. Create a new list of temperatures containing each temperature of the original list converted to a common
temperature scale (Fahrenheit, Celsius, or Kelvin).

4. For each temperature object in the new list, print out its temperature value, and if it is above the freezing
point.
