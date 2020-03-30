# Sets
I = 1:3 # 3 different crops
J = 1:3 # Set of fuels

#Labels
crops = ["soy", "sunflower", "cotton"] # for i in I
fuels  = ["B5", "B30", "B100"]
#Constraints
area = 160000
minFuel = 280000
water = 5000
petrol = 150000
#Parameters
O = [2600*0.178, 1400*0.216, 900*0.433] #Oil content l/he for different crops
P = [13/75, 0.4255, 62/75] #Profit per litre of fuel for different fuel types
W = [5, 4.2, 1] #Water demand for each crop [Ml/ha]
V = [0.05, 0.3, 1] #Part vegetable oil per diesel type
