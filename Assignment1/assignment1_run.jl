using JuMP
using Gurobi
using Plots

# optimise original model
include("assignment1_mod.jl")
model, x, y = buildBiofuelModel("assignment1_dat.jl", 1.0, 1.0, 1.0, 0.2, 0.05, 0.0)
optimize!(model)

# print information about the model
println("primal: ", primal_status(model))
println("dual: ", dual_status(model))
println("objective value = ", objective_value(model))
println("x = ",value.(x.data))
println("y = ",value.(y.data))

# create a list of model values for plotting factor differences
plotX = []
plotY = []

for factor in 0:0.01:1
    model, x, y = buildBiofuelModel("assignment1_dat.jl", 1.0, 1.0, 1.0, 0.2, 0.05, factor)

    optimize!(model)
    append!(plotX, factor)
    append!(plotY, objective_value(model))

    #println(primal_status(model))
    #println("objective value = ", objective_value(model))
    #println("x = ",value.(x.data))
    #println("y = ",value.(y.data))
    #println(factor)
    #println(objective_value(model)/548163.0342857143)
end

plot(plotX, plotY)

# source code from Canvas discussion
# originally given by Jonathan Ullmark, and Sunney Fotedar
# modified to print values of interest
model, x, y = buildBiofuelModel("assignment1_dat.jl", 1.0, 1.0, 1.0, 0.2, 0.05, 0.0)
optimize!(model)

constraintList = Vector{ConstraintRef}()
constraintListNames = Vector{String}()
all_con_names=Vector{String}()

for i in list_of_constraint_types(model)
    global constraintList
    functionType = i[1]
    setType = i[2]
    if functionType == VariableRef
        continue
    end
    append!(constraintList,all_constraints(model,functionType,setType))
end

constraintListNames = [split(string(constraint)," : ")[1] for constraint in constraintList]
constraintDictionary = Dict((constraint, constraintListNames[ind]) for (ind, constraint) in enumerate(constraintList))

for i in constraintList
    println(constraintDictionary[i], " has shadow price = ", shadow_price(i))
    println(constraintDictionary[i], " has dual = ", dual(i))
    println(constraintDictionary[i], " has rhs = ", normalized_rhs(i))
    #println(constraintDictionary[i], " has rhs pert. range = ", lp_rhs_perturbation_range(i))
end
