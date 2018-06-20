def sumDigits(s):
    total = 0
    new_list = [x for x in s if x.isdigit()]
    for e in new_list:
      total += int(e)
    return total

S=input("Enter String:")
print(sumDigits(S))
