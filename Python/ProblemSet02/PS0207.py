import string
def remove_punctuations(word):
    return "".join(i.lower() for i in word if i in string.ascii_letters)

def isPalindrome(temp):
    l = len(temp)
    i=0
    j=l-1
    count=0;
    for m in range(l//2):
        if(temp[i]!=temp[j]):
            print("Not a Palindrome")
            count+=1
            return
        else:
            i+=1
            j-=1
    
    if(count==0):
        print("It is a Palindrome")


  
word = input()
temp = remove_punctuations(word)
isPalindrome(temp)
