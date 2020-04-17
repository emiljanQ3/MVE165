using JuMP      #load the package JuMP
using Gurobi   #The commercial optimizer Gurobi requires installation


include("assignment1_mod.jl")
model, x, y = buildBiofuelModel("assignment1_dat.jl")

set_optimizer(model, Gurobi.Optimizer)
optimize!(model)

println("x = ",value.(x.data))
println("y = ",value.(y.data))
