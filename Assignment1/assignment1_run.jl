using JuMP      #load the package JuMP
using Gurobi   #The commercial optimizer Gurobi requires installation
using Plots

include("assignment1_mod.jl")

plotX = []
plotY = []

for factor in 0:0.01:2
    model, x, y = buildBiofuelModel("assignment1_dat.jl", factor, factor, 1.0)

    optimize!(model)
    append!(plotX, factor)
    append!(plotY, objective_value(model))

    println(primal_status(model))
    println("objective value = ", objective_value(model))
    println("x = ",value.(x.data))
    println("y = ",value.(y.data))
    println(factor)
    println(objective_value(model)/604843.8476190475)
end

plot(plotX, plotY)
