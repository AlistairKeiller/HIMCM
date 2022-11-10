import Pkg; Pkg.add("Agents"); Pkg.add("InteractiveDynamics"); Pkg.add("CairoMakie")
using Agents, Agents.Pathfinding, InteractiveDynamics, CairoMakie

struct egg
end

struct larva
end

struct pupa
end

struct adult
end

struct queen
end

@agent colony GridAgent{2} begin
    eggs::Vector{egg}
    larvae::Vector{larva}
    pupae::Vector{pupa}
    adults::Vector{adult}
    queens::Vector{queen}
    hybernating::Bool
end

struct tile
    land_type::Symbol
    flower_quantity::Vector{Int}
    pollen::Float64 # g
    nectar::Float64 # l
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
end

function colony_step!(colony, model)

end

function world_step!(model)
    # update food in tiles
    producing_flowers = [i for i in eachindex(model.flowers) if model.day in model.flowers[i].season]
    for row in model.map, tile in row, i in producing_flowers
        tile.pollen += tile.flower_quantity[i] * model.flowers[i].pollen
        tile.nectar += tile.flower_quantity[i] * model.flowers[i].nectar
    end

    model.day = model.day % 365 + 1
end

function create_word(
    flowers::Vector{flower}=[flower(:dandelion, 0.000433333, 0.000470167, 0.000091663467, 1.294673289, 1:364, .0012, 0.6)],
    map::Array{tile,2} = fill(tile(:grass_land, [1], 0, 0), 100, 100),
    tile_size::Float64 = 1.0,
    forging_time::Int = 8*60*60 # seconds per day
)
    space = GridSpace(size(food))
    properties = Dict(
        :flowers => flowers,
        :map => map,
        :tile_size => tile_size,
        :forging_time => forging_time
        :day => 1,
    )
    model = ABM(colony, space; properties)
    return model
end

create_word()