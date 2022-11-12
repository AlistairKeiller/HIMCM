import Pkg
Pkg.add("Agents")
Pkg.add("InteractiveDynamics")
Pkg.add("CairoMakie")
using Agents, LinearAlgebra

struct Species
    name::Symbol
    season_stop::Int
    nest_site_food_sources::Vector{Symbol}
    nest_site_land_types::Vector{Symbol}
    dev_weight_Q_pupation_min::Float64 # mg
    dev_weight_Q_pupation_max::Float64 # mg
    chanceFindNest::Float64
end

mutable struct Flowers
    name::Symbol
    protein_pollen_prop::Float64
    concentration::Float64 # mol/l
    season::UnitRange{Int}
    corolla_depth::Float64 # m
    inter_flower_time::Float64 # s
    pollen_production::Array{Float64,2}
    nectar_production::Array{Float64,2}
    pollen_quantities::Array{Float64,2}
    nectar_quantities::Array{Float64,2}
end

mutable struct Colony
    position::Tuple{Int,Int}
    queen_production_date::Int # the first date when diploid larvae eggs were laid that can develop into queens
    eusocial_phase_date::Int # emergence of the the first worker (Duchateau & Velthuis 1988)
    switch_point_date::Int # the date when the colony switches from a diploid to a haploid phase
    competition_point_date::Int # the date of a colonies' competition point
    energy_store::Float64 # J
end

@agent Bee GridAgent{2} begin
    colony::Union{Colony,Nothing}
    species::Species
    type::Symbol # egg, larva, pupa, male, worker, queen
    activity::Symbol # hibernate, nestConstruction, emerging, resting, searching, returningEmpty, returningUnhappyN, returningUnhappyP, nectarForaging, collectNectar, bringingNectar, expForagingN, pollenForaging, collectPollen, bringingPollen, expForagingP, egglaying, nursing
    emerging_date::Int
    weight::Float64 # mg
    age::Int # days
end

function winter_mortality_probibility(bee){
    # Winter survival (survival_probibility) is calculated from Beekman et al 1998 (Entomologia Experimentalis et Applicata 89: 207–214, 1998)
    # Fig. 1B: survival prob. is calculated from proportion of survivors to survivors + non-survivors. Using the relative weight rather than the absolute weight, we fitted a sigmoid curve (survivalProb) to the left site only,
    # as the low surv. prob. of heavy queens is an artefact of the treatment:
    # "One would expect that queens with the highest weight will survive diapause. It is therefore surprising that the initial weight distribution of dead queens exceeds that of the surviving queens (Figure 1B and 1C).
    # However, in 1993 the average initial weight of the queens was highest and in this period the most severe diapause regimes (6 or 8 months) were started. Since the majority of the queens that were given a treatment
    # with a length of 6 or 8 months died, the initial weight distribution of dead queens exceeds that of the surviving queens."

    relative_weight = (bee.weight - bee.species.dev_weight_Q_pupation_min) / (bee.species.dev_weight_Q_pupation_max - bee.species.dev_weight_Q_pupation_min)
    survival_probibility = 0.64 / (1 + ℯ^(-22 * (relative_weight - 0.32))) # returns survival_probibility
}

    function find_nesting_site(bee, model)
        # TODO: add a minimum nesting site area
        # TODO: randomly select a nest site out of possibilities
        for i ∈ 1:model.sizeof(land_type)[1], j ∈ 1:model.sizeof(land_type)[2]
            if model.land_type[i, j] ∈ bee.species.nest_site_land_types && norm((i, j) - bee.pos) && any(flowers -> flowers.name ∈ bee.species.nest_site_food_sources && flowers.pollen_production[i, j] != 0, model.flowers)
                return (i, j)
            end
        end
    end

    function competition_point_date(colony, model)
        # determines the date of a colonies' competition point
        # from Duchateau & Velthuis 1988, Fig. 6
        return min(Int(0.7 * (colony.queen_production_date - colony.eusocial_phase_date) + 15.5), 45) + colony.eusocial_phase_date
    end

    function bee_step!(bee, model)
        # kill all bees that are not hibernating at the end of the season
        if bee.species.season_stop == model.ticks % 365 && bee.activity != :hibernate
            kill_agent!(bee, model)
        end

        # new queens emerge from hibernation and found new colonies (note: most queens will still be represented as cohorts here!) 
        # Winter survival (survivalProb) is calculated from Beekman et al 1998 (Entomologia Experimentalis et Applicata 89: 207–214, 1998)
        # Fig. 1B: survival prob. is calculated from proportion of survivors to survivors + non-survivors. Fitted a sigmoid curve to the left site only, as the low surv. prob. of heavy queens
        # is an artefact of the treatment:
        # "One would expect that queens with the highest weight will survive diapause. It is therefore surprising that the initial weight distribution of dead queens exceeds that of the surviving queens (Figure 1B and 1C).
        # However, in 1993 the average initial weight of the queens was highest and in this period the most severe diapause regimes (6 or 8 months) were started. Since the majority of the queens that were given a treatment
        # with a length of 6 or 8 months died, the initial weight distribution of dead queens exceeds that of the surviving queens."
        if bee.emerging_date == model.ticks
            bee.activity = :emerging
        end
        if bee.activity == :emerging
            # WINTER MORTALITY:
            # Queen has a risk of dying over winter:
            if rand() < winter_mortality_probibility(bee)
                kill_agent!(bee, model)
            end

            # AFTER SURVIVAL:
            bee.activity = :resting
            bee.colony = nothing
        end
        if bee.type == :queen && bee.colony === nothing && bee.activity != :hibernate
            # searching for nest
            if rand() < bee.species.chanceFindNest
                # found nest
                new_colony = Colony(find_nesting_site(bee, model), ∞, ∞, ∞, ∞, 873)
                bee.colony = new_colony
                append!(model.colonies, new_colony)
                bee.activity = :resting
            else
                if rand() < 1 - ((1 - model.mortality_forager)^(model.nest_search_time))
                    kill_agent!(bee, model)
                end
            end
        end

        personal_time = rand(1:1800)
        activityList = []

    end

    function world_step!(model)
        # update food in tiles
        for flowers ∈ model.flowers
            if model.ticks % 365 ∈ flowers.season
                flowers.pollen_quantities += flower.pollen_production
                flowers.nectar_quantities += flower.nectar_production
            end
        end

        # kill males in autumn if all queens are in hibernation and no brood is left
        if !any(bee -> bee.type == :queen && bee.activity != :hibernate, model) && !any(bee -> bee.type == :egg || bee.type == :larva || bee.type == :pupa, model)
            for bee ∈ model
                if bee.type == :male
                    kill_agent!(bee, model)
                end
            end
        end

        for colony ∈ model.colonies
            # determine competition point date
            if model.ticks > colony.competition_point_date && !any(bee -> bee.colony === colony && (bee.type == :egg || bee.type == :larvae || bee.type == :pupea, model)) # death of colony after competition point
                for bee ∈ model
                    if bee.colony === colony && bee.age > 10 && (bee.type == :worker || bee.type == :queen)
                        kill_agent!(bee, model)
                    end
                end
            end

            # kill a colony if it has no energy
            if colony.energy_store <= 0
                for bee ∈ model
                    if bee.colony === colony
                        kill_agent!(bee, model)
                    end
                end
            end

            # kill a colony if it has no adult bees
            if !any(bee -> bee.colony === colony && (bee.type == :male || bee.type == :worker || bee.type == :queen), model)
                for bee ∈ model
                    if bee.colony === colony
                        kill_agent!(bee, model)
                    end
                end
            end

            # determine eusocial phase (starts with emergence of first worker):
            if colony.eusocial_phase_date == ∞ && any(bee -> bee.colony === colony && bee.type == :worker, model)
                colony.eusocial_phase_date = model.ticks
            end

            if colony.switch_point_date == ∞ && eusocial_phase_date != ∞ && count(bee -> bee.colony === colony && bee.type == :larva) / count(bee -> bee.colony === colony && bee.type == :worker) > 3 && rand() > 0.13 # derived from Duchateau & Velthuis 1988 (50% of the (early switching) colonies switch within ca. 2*2.4d, i.e. 13% per day)
                colony.switch_point_date = model.ticks
            end

            if model.competition_point_date == ∞ && eusocial_phase_date != ∞ && queen_production_date != ∞
                colony.competition_point_date = competition_point_date(colony, model)
            end


        end
    end

    model.ticks += 1
end

function create_word(
    flowers::Vector{Flowers}=[
        Flowers(
            :dandelion,
            0.091663467,
            1.294673289,
            1:364,
            0.0012,
            0.6,
            ones(100, 100) * 0.000433333,
            ones(100, 100) * 0.000000470167,
            zeros(100, 100),
            zeros(100, 100)
        )
    ],
    land_type::Array{Symbol,2}=fill(:grass_land, 100, 100),
    tile_size::Float64=1.0, # m
    forging_time::Int=8 * 60 * 60, # seconds per day
    nest_search_time::Int=6 * 60 * 60, # seconds
    mortality_forager::Float=1.0e-5, # seconds^-1
    colonies::Vector{Colony}=[Colony((50, 50))],
)
    space = GridSpace(sizeof(land_type))
    properties = Dict(
        :flowers => flowers,
        :land_type => land_type,
        :tile_size => tile_size,
        :forging_time => forging_time,
        :nest_search_time => nest_search_time,
        :mortality_forager => mortality_forager,
        :colonies => colonies,
        :ticks => 0,
    )
    model = ABM(Bee, space; properties)
    return model
end

create_word()