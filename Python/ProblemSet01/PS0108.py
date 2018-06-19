def getRatios(vect1, vect2):
    ratios = []
    for index in range(len(vect1)):
        try:
            ratios.append(vect1[index]/float(vect2[index]))
        except ZeroDivisionError:
            ratios.append(float('nan')) #nan = Not a Number
        except:
            raise ValueError('getRatios called with bad arguments')
    return ratios


#print(getRatios([1.0,2.0,7.0,6.0], [1.0,2.0,0.0,3.0]))
#print(getRatios([], []))
