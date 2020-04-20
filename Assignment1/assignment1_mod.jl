"""
  Construct and returns the model of this assignment.
"""
function buildBiofuelModel(data_file::String, waterFactor::Float64, areaFactor::Float64, petrolFactor::Float64)
  include(data_file)
  #I: set of  crops
  #J: set of fuels
  #crops: name of the crops, i in I
  #fuels: name of the fuels, j in J
  # O[i]: amount of oil for crop i [l/ha]
  # P[j] amount of profit from selling j [€/l]

  #name the model
  model = Model(with_optimizer(Gurobi.Optimizer, OutputFlag=0))

  @variable(model, x[I] >= 0) # crops grown [ha]
  @variable(model, y[J] >= 0) # fuel produced [l]

  #maximize the profit
  @objective(model, Max, sum(P[j]*y[j] for j in J))

  modifiedWater = water*waterFactor
  modifiedArea = area*areaFactor
  modifiedPetrol = petrol*petrolFactor

  @constraint(model, areaConstraint, sum(x[i] for i in I) <= modifiedArea) #
  @constraint(model, fuelDemand, sum(y[j] for j in J) >= minFuel)
  @constraint(model, waterConstraint, sum(x[i]*W[i] for i in I) <= modifiedWater)
  @constraint(model, petrolConstraint, sum(y[j]*(1-V[j]) for j in J) <= modifiedPetrol)
  @constraint(model, vegOilConstraint, sum(y[j]*(V)[j]*U_V for j in J) <= sum(x[i]*O[i] for i in I))

  return model, x, y
end
