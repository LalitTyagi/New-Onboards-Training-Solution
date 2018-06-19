## ProblemSet03

1. A string slice can take a third index that specifies the "step size;" that is, the number
of spaces between successive characters. A step size of 2 means every other character; 3 means every
third, etc.
```python
>>> fruit = 'banana'
>>> fruit[0:5:2]
'bnn'
```
A step size of -1 goes through the word backwards, so the slice [::-1] generates a reversed string.
Use this idiom to write a one-line version of is_palindrome

2. Write a function called rotate_word() that takes a string and an integer as parameters, and that
returns a new string that contains the letters from the original string "rotated" by the given amount.
For example, "cheer" rotated by 7 is "jolly" and "melon" rotated by -10 is "cubed".
You might want to use the built-in functions ord, which converts a character to a numeric code,
and chr, which converts numeric codes to characters.

3. In 1939 Ernest Vincent Wright published a 50,000 word novel called Gadsby that
does not contain the letter "e." Since "e" is the most common letter in English, that’s not easy to
do.
In fact, it is difficult to construct a solitary thought without using that most common symbol. It is
slow going at first, but with caution and hours of training you can gradually gain facility.
All right, I’ll stop now.
Write a function called has_no_e that returns True if the given word doesn’t have the letter "e" in
it.

4. Modify the above program to print only the words that have no “e” and compute the percentage of the words in the list have no “e.”

5. Write a function named avoids that takes a word and a string of forbidden letters,
and that returns True if the word doesn’t use any of the forbidden letters.

6. Modify your program to prompt the user to enter a string of forbidden letters and then print the
number of words that don’t contain any of them. Can you find a combination of 5 forbidden letters
that excludes the smallest number of words?

7. Write a function named using_only() that takes a word and a string of letters, and
that returns True if the word contains only letters in the list. Can you make a sentence using only
the letters acefhlo? Other than "Hoe alfalfa?"

8. Write a function called is_abecedarian that returns True if the letters in a word
appear in alphabetical order (double letters are ok). How many abecedarian words are there?
(i.e) "Abhor" or "Aux" or "Aadil" should return "True"  Banana should return "False"

9. Write a function called is_sorted that takes a list as a parameter and returns True
if the list is sorted in ascending order and False otherwise. You can assume (as a precondition) that
the elements of the list can be compared with the relational operators <, >, etc.
For example, is_sorted([1,2,2]) should return True and is_sorted(['b','a']) should return
False.

10. Two words are anagrams if you can rearrange the letters from one to spell the other.
Write a function called is_anagram that takes two strings and returns True if they are anagrams.