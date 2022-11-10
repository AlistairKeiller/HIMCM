struct InitialQueen
    QueenType::String
    QueenCount
end

struct FlowerPart
    FlowerType::String
    FlowerAmount
end

struct Tile
    TileType::String
    TileFlowers::Vector{FlowerPart}
end

struct BeeSpecies
    name::String
    emergingDay_mean
    emergingDay_sd
    nestHabitats::Vector{String}
    proboscis_min # m
    proboscis_max # m
    growthFactor
    seasonStop
    maxLifespanWorkers
    batchsize
    flightVelocity # m/s
    searchLength # m
    timeUnloading # s
    specMax_cropVolume # myl
    specMax_pollenPellets # g
    minToMaxFactor
    devAgeHatchingMin # d
    devAgePupationMin # d
    devAgeEmergingMin # d
    devWeightEgg # mg
    devWeightPupationMin # mg
    devWeightPupationMax # mg
    pollenToBodymassFactor
    dev_Q_DeterminationWeight # mg
    devAge_Q_PupationMin # d
    devWeight_Q_PupationMin # mg
    devWeight_Q_PupationMax # mg
    devAge_Q_EmergingMin # d
    dailyNestSiteChance
end

# user params
InitialQueensList = [InitialQueen("B_terrestris", 500)]
MortalityForager = 1.0e-5 # 1/s
# 1.0e-5 for high, 2.14e-6 for intermediate, and 2.75e-07 for low
Lambda_detectProb = -0.005
MaxForagingRange = 10000 # m
ForagingPeriod = 8*60*60 # s
Map = fill(Tile("Grass", [FlowerPart("Grass", 1.0)]), 500, 500)
Species = [BeeSpecies("B_terrestris", 91, 28, ["Grassland", "Garden", "Hedgerow", "Scrub", "Woodland", "Nestboxes"], 6.9, 11.1, 1.88, 305, 60, 12, 5, 2500, 165, 173, 0.15, 2, 5, 12.9, 23.8, 1.5, 62.4, 249.5, 1, 0, 17, 590, 980, 32, 0.2)]

for queen in InitialQueensList
    


# beesteward ParametersProc
# AssertionViolated::Bool = false
# CallItaDay = 24*60*60
# DailySwitchProbability = 0.13
# EnergyFactorOnFlower = 0.3
# EnergyHoney = 22.67 # kJ/ml
# EnergyRequiredForPollenAssimilation = 6.2 # kJ/g
# EnergySucrose = 0.00582 # kJ/mymol
# FoodsourcesInFlowerUpdate::Bool = false
# ForagingRangeMax = 758 # m
# GetUpTime = 1 # s
# LarvaWorkerRatioTH = 3
# MaxLifespanMales = 30
# MetabolicRateFlight = 488.6 # W/kg
# MortalityAdultsBackground_daily = 0
# N_ForeignAlleles = 24
# NestSearchTime_h = 6
# NotSetHigh = 999999999999999
# NotSetLow = -999999999999999
# QueenDestinedEggsBeforeSP_d = 5
# QueensProducingColoniesList = []
# Sunrises = 8*60*60 # s
# SelectedFieldsList = []
# PopulationSizeDay365List = []
# Survived::Bool = true

# beesteward CreateFoodsourcesProc
