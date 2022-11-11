import Pkg; Pkg.add("Agents"); Pkg.add("InteractiveDynamics"); Pkg.add("CairoMakie")
using Agents, Agents.Pathfinding, InteractiveDynamics, CairoMakie

struct bee
    type::Symbol # egg, larva, pupa, male, worker, queen
    activity::Symbol # hibernate, nestConstruction, resting, searching, returningEmpty, returningUnhappyN, returningUnhappyP, nectarForaging, collectNectar, bringingNectar, expForagingN, pollenForaging, collectPollen, bringingPollen, expForagingP, egglaying, nursing
end

struct species
    name::Symbol
    seasonStop::Int
end

@agent colony GridAgent{2} begin
    species::species
    bees::Vector{bee}
end

struct flower
    name::Symbol
    pollen::Float64 # g/flower
    nectar::Float64 # l/flower
    protein_pollen_prop::Float64
    concentration::Float64 # mol/l
    season::UnitRange{Int}
    corolla_depth::Float64 # m
    inter_flower_time::Float64 # s
    flower_quantities::Array{Int,2}
    pollen_quantities::Array{Float64,2}
    nectar_quantities::Array{Float64,2}
end

function colony_step!(colony, model)
    # seasonal events
    # kill all bees that are not hibernating at the end of the season
    if model.day == colony.species.seasonStop
        colony.bees = filter(bee -> bee.activity == :hibernate, colony.bees)
    end
    # kill males in autumn if all queens are in hibernation and no brood is left
    if !any(bee -> bee.type == :queen && bee.activity != :hibernate, colony.bees) && !any(bee -> bee.type == :egg || bee.type == :larva || bee.type == :pupa, colony.bees)
        colony.bees = filter(bee -> bee.type != :male, colony.bees)
    end
end

function world_step!(model)
    # update food in tiles
    for flower in model.flowers
        if model.day in flower.season
            flower.pollen_quantities += flower.flower_quantities * flower.pollen
            flower.nectar_quantities += flower.flower_quantities * flower.nectar
        end
    end

    model.day = model.day % 365 + 1
end

function create_word(
    flowers::Vector{flower} = [flower(:dandelion, 0.000433333, 0.000470167, 0.000091663467, 1.294673289, 1:364, .0012, 0.6, ones(Int, 100, 100), zeros(100, 100), zeros(100, 100))],
    land_type::Array{Symbol, 2} = fill(:grass_land, 100, 100),
    tile_size::Float64 = 1.0,
    forging_time::Int = 8*60*60 # seconds per day
)
    space = GridSpace(size(land_type))
    properties = Dict(
        :flowers => flowers,
        :land_type => land_type,
        :tile_size => tile_size,
        :forging_time => forging_time,
        :day => 1
    )
    model = ABM(colony, space; properties)
    return model
end

create_word()