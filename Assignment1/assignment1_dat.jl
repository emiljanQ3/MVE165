# Sets
I = 1:3 # 3 different crops
J = 1:3 # Set of fuels
#Labels
crops = ["soy", "sunflower", "cotton"] # for i in I
fuels  = ["B5", "B30", "B100"] # for j in J
#Constraints
<<<<<<< HEAD
area = 1600
minFuel = 280000
water = 5000
petrol = 150000
=======
area = 160000 #[ha]
minFuel = 280000 #[l]
water = 5000 #[l]
petrol = 150000 #[l]
>>>>>>> df83e3500ea5943c7a229ac525ce4bd625b6b109
#Constants
R = 1 #Petrol price in [€/l]
M = 1.5 #Methanol price [€/l]
U_M = 0.2/0.9 #Unit methanol needed per unit biodiesel
U_V = 1/0.9 #Unit vegetable oil needed per unit biodiesel
S = [0.178, 0.216, 0.433] #Oil content in seeds for i in I [l/kg]
Y = [2600, 1400, 900] #Yield for i in I [kg/he]
B = [1.43, 1.29, 1.16] #Price for j in J [€/l]
T = [0.2, 0.05, 0] #Part tax of price for j In J
#Parameters
<<<<<<< HEAD
V = [0.05, 0.3, 1] #Part vegetable oil per diesel type
O = Y .* S #Oil content l/he for different crops
P = B .* (1 .- T) - V * M * U_M - (1 .- V) * R #Profit for j in J [€/l]
W = [5, 4.2, 1] #Water demand for each crop [Ml/ha]
=======
V = [0.05, 0.3, 1] #Part vegetable oil for j in J
O = Y .* S #Oil yield for i in I [l/he]
P = B .* (1 .- T) - V * M * U_M - (1 .- V) * R #Profit per litre of fuel for j in J [€]
W = [5, 4.2, 1] #Water demand for i in I [Ml/ha]
>>>>>>> df83e3500ea5943c7a229ac525ce4bd625b6b109
