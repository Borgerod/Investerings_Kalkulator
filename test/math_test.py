import pandas as pd 
import math 
import numpy as np
print()
print()



principalAmt = 20000.0
terms = 10.0
interestRate = 6.0
compoundsPerYear = 12.0
monthlyContribution = 100.0
dividend = interestRate/100
i = terms
raisedtopower2 = (compoundsPerYear * terms);



# PRESENT VALUE OF INVESTMENT
PV=principalAmt*(pow((1+(dividend/compoundsPerYear)),(compoundsPerYear*terms)))



# VALUE OF CONTRIBUTION - END OF MONTH (AFTER)
pmt_a = monthlyContribution*(pow((1+dividend/compoundsPerYear),(compoundsPerYear*terms))-1)/(dividend/compoundsPerYear)

# FINAL VALUE AFTER
FVa = pmt_a+PV

# INTEREST PAYED THAT PERIOD [AFTER] [%]
ira = compoundsPerYear * (pow((FVa / principalAmt), (1 / raisedtopower2)) - 1)
# INTEREST PAYED THAT PERIOD [AFTER] [in Kr]
ira_Kr = FVa*ira


# VALUE OF CONTRIBUTION - BEGINNING OF MONTH (BEFORE)
extra = (1+(dividend/compoundsPerYear))
pmt_b = pmt_a*extra

# FINAL VALUE AFTER
FVb =  pmt_b+PV

# INTEREST PAYED THAT PERIOD [BEFORE] [%]
irb = compoundsPerYear * (pow((FVb / principalAmt), (1 / raisedtopower2)) - 1)
# INTEREST PAYED THAT PERIOD [BEFORE] [in Kr]
irb_Kr = FVb*(pow((1+irb),(terms/compoundsPerYear))-1)
# irb_Kr = FVb*irb


print("__ After: ____")
print(f'PV: {round(PV, 2)}')
print(f'pmt_a: {round(pmt_a, 2)}')
# print(f'Ir : {round((ira*100), 2)}%')
# print(f'Ir Kr: {round(ira_Kr, 2)},-')
print(f'= FVa: {round(FVa, 2)}')
print()
print("__ Before: ____")
print(f'PV: {round(PV, 2)}')
print(f'pmt_b: {round(pmt_b, 2)}')
# print(f'Ir : {round((irb*100), 2)}%')
# print(f'Ir Kr: {round(irb_Kr, 2)},-')
print(f'= FVb: {round(FVb, 2)}')

print()
print()
print("________________")
totalContributions = (monthlyContribution*raisedtopower2)

endPrinciple = principalAmt+totalContributions
print(f'starting amount: {round(principalAmt, 2)}')
print(f'totalContributions: {round(totalContributions, 2)}')
print()
print(f'endPrinciple: {round(endPrinciple, 2)}')
print(f'FVa: {round(FVa, 2)}')
Ira = FVa -  endPrinciple
print(f'Ira: {round(Ira, 2)}')
# print()










