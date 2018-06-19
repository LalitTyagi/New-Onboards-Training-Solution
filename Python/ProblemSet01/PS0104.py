#Practice using the Python interpreter as a calculator:

#a) The volume of a sphere with radius r is 4/3pr3. What is the volume of a sphere with radius 5?
#Hint: 392.7 is wrong!
import math


r=int(input())

print( 4/3*math.pi*(r**3))

#b) Suppose the cover price of a book is Rs.24.95, but bookstores get a 40% discount. Shipping costs
#Rs.3 for the first copy and 0.75p for each additional copy. What is the total wholesale cost for
#60 copies?
price = 24.95*0.6
ship_cost = 3
ship_cost_copy = 0.75
total_sum = price + ship_cost + (price + ship_cost_copy)*59
print('Total wholesale cost for 60 copies is {0:.2f}'.format(total_sum))


#c) If I leave my house at 6:52 am and run 1 mile at an easy pace (8:15 per mile), then 3 miles at
#tempo (7:12 per mile) and 1 mile at easy pace again, what time do I get home for breakfast?
start_time = (6*60 + 52)*60
easy_time = (8*60 + 15)*2
tempo_time = (7*60 + 12)*3

breakfast_hour = (start_time + easy_time + tempo_time)/(60*60)
breakfast_int_hour = int(breakfast_hour)

breakfast_minute  = (breakfast_hour - breakfast_int_hour)*60
breakfast_int_minute = int(breakfast_minute)

print('Breakfast is at {}.{}'.format(breakfast_int_hour,breakfast_int_minute))
