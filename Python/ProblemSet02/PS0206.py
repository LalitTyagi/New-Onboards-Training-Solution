def findAnEven(arr,num):
    count = 0;
    for i in range(num):
        if(arr[i]%2==0):
            print(arr[i])
            count+=count
            return
    if(count==0):
        print("Array does not contain an even number.")

arr = list()
num = int(input("Enter how mayn element in Array.:"))
print('Enter numbers in array.:')
for i in range (num):
    temp = input()
    arr.append(int(temp))

findAnEven(arr,num)
