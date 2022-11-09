AbundanceBoost
ActiveBee
ActiveBeesSortedList
AllParametersList
AssertionMessage
AssertionViolated::Bool = false
BackgroundColor = 5
Backgroundcolour
BackgroundImage
BehaviourSpaceParameters
BehavSpaceParameterValuesList
BehavSpaceCurrentValue
Black_TH
BorderColor
BottomBorder
BrushArea_ha
BS_ScaleDistance_m
Button1Monitor
Button2Monitor
Button3Monitor
Button4Monitor
Button5Monitor
Button6Monitor
Button7Monitor
CallItaDay = 24*60*60 # s
ChosenPatchtypeVariable
CohortSymbolSize = 0.75 * MasterSizeFactor
COLONIES_IBM
ColonyDeathsEndSeason
ColonyDeathsNoBees
ColonyDensity_km2
ColonySymbolSize = 9 * MasterSizeFactor
ColourCodeList
CropRotationList = CropRotationListAsString # TODO: make a list
CropRotationListAsString
CSS_OptionsList = [ "margin", "legume", "plot" ]
CSS_TotalAreaAll_ha
CSS_TotalAreaLegume_ha
CSS_TotalAreaMargin_ha
CSS_TotalAreaPlot_ha
CumulVisitsOnlyLastYear::Bool
DailyForagingPeriod_s
DailySwitchProbability = 0.13
Date
Day
Daytime_s
EnergyFactorOnFlower = 0.3
EnergyHoney = 22.0 # kJ/ml
EnergyRequiredForPollenAssimilation = 6.2 # kJ/g
EnergySucrose = 0.00582 # kJ/mymol
FlowerspeciesFile
FlowerSpeciesList_Legume
FlowerSpeciesList_Margin
FlowerSpeciesList_Plot
FoodSourceLimit
FoodsourcesInFlowerUpdate::Bool = false
FoodsourceSymbolSizeFactor = 1.5 * MasterSizeFactor
ForagingFileList
ForagingMortalityFactor
ForagingMortalityModel
ForagingRangeMax = 758 # m
Gap_s
GenericInputNumber
GenericRunCommandValue
GetUpTime = 1 # s
Gridsize
HabitatDataCSV
HabitatsFile
FoodsourcesFile = "Foodsources.txt"
InspectTurtle
KeepDeadColonies::Bool
Lambda_detectProb
LarvaWorkerRatioTH = 3
MapAreaIncluded
MasterSizeFactor
MaxForagingRange_m
MaxHibernatingQueens
MaxLifespanMales = 30
MaxPatchRadius_m
MeanAdultWeight_mg
MeanQueenWeight_mg
MeanWorkerWeight_mg
MergeHedges::Bool
MetabolicRateFlight = 488.6 # W/kg
MinFoodSourceSymbolSize = 2.5 * MasterSizeFactor
MinSizeFoodSources::Bool
MortalityAdultsBackground = 0 # 1/d
MortalityForager # 1/s
MyValue
N_Badgers
N_ForeignAlleles = 24
N_Psithyrus
NectarAvailableTotalToday_l
NestSearchTime = 6 # h
NotSetHigh = 999999999999999
NotSetLow = -1 * NotSetHigh
Npatches
OutputWordResult
PatchColoursList
Patchtype_Legume
Patchtype_Margin
Patchtype_Plot
PollenAvailableTotalToday_kg
QueenDestinedEggsBeforeSP = 5 # d
QueensProducingColoniesList = []
QueenSymbolsize = 2 * MasterSizeFactor
RemoveEmptyFoodSources::Bool
Repetitions
RightBorder
SatelliteFile
SelectedFieldsList = []
SetColour
SexLocus::Bool
ShowCohorts::Bool
ShowDeadCols::Bool
ShowFoodsources::Bool
ShowGrid::Bool
ShowInspectedColony::Bool
ShowMasterpatchesOnly::Bool
ShowNests::Bool
ShowPlots::Bool
ShowQueens::Bool
ShowSearchingQueens::Bool
ShowWeather::Bool
BeespeciesFile
SpeciesList
StepWidth = 0.5 * MasterSizeFactor
StopExtinct::Bool
Sunrise = 8*60*60 # s
SwitchOn
TextMap
TopBorder
TotalActiveBees
TotalAdultMales
TotalAdultMalesEverProduced
TotalAdultQueens
TotalAdultQueensEverProduced
TotalAdults
TotalAdultsEverProduced
TotalAdultWorkers
TotalBeeAgents
TotalBeesEverDied
TotalBeesEverProduced
TotalColonies
TotalColoniesEverProduced
TotalEggs
TotalFoodSources
TotalForagingTripsToday
TotalHibernatingQueens
TotalHibernatingQueensEverRemoved
TotalIBMColonies
TotalLarvae
TotalMales
TotalMapArea_km2
TotalMatedQueens
TotalPupae
TotalQueens
TotalUnmatedQueens
UnlimitedMales::Bool
UserHabitatSelected
Weather
White_TH
WinterMortality::Bool
BeeSpeciesInitialQueensList
BeeSpeciesInitialQueensListAsString
Report_name
BeeSpeciesDefinedList
InitialQueensModifierBehaviorSpace
PopulationSizeDay365List = []
Survived::Bool = true
TimeToExtinction

if ForagingMortalityModel == "high"
    MortalityForager = 1.0e-5
elseif ForagingMortalityModel == "intermediate"
    MortalityForager = 2.14E-06
elseif ForagingMortalityModel == "low"
    MortalityForager = 2.75E-07
end

struct habitats
    flowerspecieslist
    habitatColourID
    colourRangeMin
    colourRangeMax
    habitatType
    habitatSwitchedOn::Bool
end

struct bees
    activity
    activityList
    adultAge
    allelesList
    brood::Bool
    broodAge
    caste
    colonyID
    cropvolume_myl
    cumulIncubationReceived_kJ
    cumulTimeEgg_d
    cumulTimeLarva_d
    cumulTimePupa_d
    currentFoodsource
    emergingDate
    expectation_NectarTrip_s
    expectation_PollenTrip_s
    glossaLength_mm
    knownMasterpatchesNectarList
    knownMasterpatchesPollenList
    mated
    mtDNA
    nectarLoadSquadron_kJ
    nectarsourceToGoTo
    number
    personalTime_s
    ploidy
    pollenForager
    pollenLoadSquadron_g
    pollenPellets_g
    pollensourceToGoTo
    speciesID
    speciesName
    spermathecaList
    stage
    thEgglaying
    thForagingNectar
    thForagingPollen
    thNursing
    weight_mg
end

struct colonies
    allAultActiveQueens
    allAdultMales
    allAdultQueens
    allAdults
    allAdultWorkers
    allEggs
    allLarvae
    allPatchesInRangeList
    allPupae
    allSourcesInFlowerAndRangeList
    broodDeathBadger
    broodDeathEndSeason
    broodDeathsCP
    broodDeathsEnergyStores
    broodDeathsNoAdults
    cohortBased::Bool
    colonyAge
    colonyFoundationDay
    colonysize
    colonyWeight_mg
    competitionPointDate
    eggDeathsIncubation
    energyNeedToday_kJ
    energyStore_kJ
    eusocialPhaseDate
    idealEnergyStore_kJ
    idealPollenStore_g
    larvaDeathsIncubation
    larvaDeathsWeight
    larvaWorkerRatio
    masterpatchesInRangeList
    masterpatchesWithNectarlayersInFlowerAndRangeList
    masterpatchesWithPollenlayersInFlowerAndRangeList
    nectarInFlowerAndRangeList
    pollenInFlowerAndRangeList
    pollenNeedLarvaeToday_g
    pollenStore_g
    pupaDeathsIncubation
    queenProduction::Bool
    queenProductionDate
    queenright::Bool
    speciesIDcolony
    speciesNameColony
    stimEgglaying
    stimNectarForaging
    stimNursing
    stimPollenForaging
    summedIncubationToday_kJ
    switchPointDate
    totalAdultsProduced
    totalEggsProduced
    totalLarvaeProduced
    totalMalesProduced
    totalPupaeProduced
    totalQueensProduced
    totalWorkersProduced
end

struct deadCols
  colonyDeathDay
  allAdultActiveQueens
  allAdultMales
  allAdultQueens
  allAdults
  allAdultWorkers
  allEggs
  allLarvae
  allPatchesInRangeList
  allPupae
  allSourcesInFlowerAndRangeList
  broodDeathBadger
  broodDeathEndSeason
  broodDeathsCP
  broodDeathsEnergyStores
  broodDeathsNoAdults
  cohortBased::Bool
  colonyAge
  colonyFoundationDay
  colonysize
  colonyWeight_mg
  competitionPointDate
  eggDeathsIncubation
  energyNeedToday_kJ
  energyStore_kJ
  eusocialPhaseDate
  idealEnergyStore_kJ
  idealPollenStore_g
  larvaDeathsIncubation
  larvaDeathsWeight
  larvaWorkerRatio
  masterpatchesInRangeList
  masterpatchesWithNectarlayersInFlowerAndRangeList
  masterpatchesWithPollenlayersInFlowerAndRangeList
  nectarInFlowerAndRangeList
  pollenInFlowerAndRangeList
  pollenNeedLarvaeToday_g
  pollenStore_g
  pupaDeathsIncubation
  queenProduction::Bool
  queenProductionDate
  queenright::Bool
  speciesIDcolony
  stimEgglaying
  stimNectarForaging
  stimNursing
  stimPollenForaging
  summedIncubationToday_kJ
  switchPointDate
  totalAdultsProduced
  totalEggsProduced
  totalLarvaeProduced
  totalMalesProduced
  totalPupaeProduced
  totalQueensProduced
  totalWorkersProduced
end

struct species
    batchsize
    chanceFindNest
    dev_larvalAge_QueenDetermination_d
    dev_Q_DeterminationWeight_mg
    devAge_Q_EmergingMax_d
    devAge_Q_EmergingMin_d
    devAge_Q_PupationMax_d
    devAge_Q_PupationMin_d
    devAgeEmergingMax_d
    devAgeEmergingMin_d
    devAgeHatchingMax_d
    devAgeHatchingMin_d
    devAgePupationMax_d
    devAgePupationMin_d
    devIncubation_Q_EmergingTH_kJ
    devIncubation_Q_PupationTH_kJ
    devIncubationEmergingTH_kJ
    devIncubationHatchingTH_kJ
    devIncubationPupationTH_kJ
    devQuotaIncubationToday_kJ
    devWeight_Q_PupationMax_mg
    devWeight_Q_PupationMin_mg
    devWeightEgg_mg
    devWeightPupationMax_mg
    devWeightPupationMin_mg
    emergingDay_mean
    emergingDay_sd
    flightCosts_kJ/m/mg
    flightVelocity_m/s
    growthFactor
    maxLifespanWorkers
    minPollenStore_g
    minToMaxFactor
    name
    nestHabitatsList
    nestSiteArea
    nestsiteFoodsourceList
    pollenToBodymassFactor
    proboscis_max_mm
    proboscis_min_mm
    searchLength_m
    seasonStop
    specMax_cropVolume_myl
    specMax_pollenPellets_g
    timeUnloading
end

struct foodsources
    area_sqm
    colorMemo
    corollaDepth_mm
    cumulNectarVisits
    cumulPollenVisits
    flowerSpecies_relativeAbundanceList
    flowerSpeciesList
    id_Beescout
    interFlowerTime_s
    layersInPatchList
    masterpatch::Bool
    masterpatchID
    nectar_myl
    nectarConcentration_mol/l
    nectarFlowerVolume_myl
    nectarMax_myl
    patchInfo
    patchType
    pollen_g
    pollenMax_g
    proteinPollenProp
    radius_m
    startDay
    stopDay
    farmland::Bool
    stewardshipSpeciesList
    perimeter_m
    occurrence
    cso_area_m2
end

struct patches
    nColonies
    nMalesProduced
    nQueensProduced
    pcolorSave
    flowerPatchID
    firstPatchOfFlowerpatch
    mapDisplay
    originalColor
    patchColor
    habitatTypePatch
    satelliteColor
    visits
end

struct storebars
    maxSize
    store
    storeColonyID
end

struct patchStatistics
    areaPx
    areaSqm
    patchType
    flowerSpeciesList
    patchInfo
    perimeter_m
end

struct button
    myLabel
    myCommand
    on::Bool
    exitButton::Bool
    headerButton::Bool
end