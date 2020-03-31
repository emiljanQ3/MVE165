# Sets
I = 1:3 # 3 different crops
J = 1:3 # Set of fuels
#Labels
crops = ["soy", "sunflower", "cotton"] # for i in I
fuels  = ["B5", "B30", "B100"] # for j in J
#Constraints
area = 160000
minFuel = 280000
water = 5000
petrol = 150000
#Constants
R = 1 #Petrol price in €/l
M = 1.5 #Methanol price in €/l
S = [0.178, 0.216, 0.433] #Oil content in seeds for i in I [l/kg]
Y = [2600, 1400, 900] #Yield for i in I [kg/he]
B = [1.43, 1.29, 1.1] #Price for j in J [€/l]
T = [0.2, 0.05, 0] #Part tax of price for j In J
#Parameters
V = [0.05, 0.3, 1] #Part vegetable oil per diesel type
O = [2600*0.178, 1400*0.216, 900*0.433] #Oil content l/he for different crops
P = [13/75, 0.4255, 62/75] #Profit per litre of fuel for different fuel types
W = [5, 4.2, 1] #Water demand for each crop [Ml/ha]
