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
Daytime # s
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
    cropvolume # myl
    cumulIncubationReceived # kJ
    cumulTimeEgg_d
    cumulTimeLarva_d
    cumulTimePupa_d
    currentFoodsource
    emergingDate
    expectation_NectarTrip # s
    expectation_PollenTrip # s
    glossaLength # mm
    knownMasterpatchesNectarList
    knownMasterpatchesPollenList
    mated
    mtDNA
    nectarLoadSquadron # kJ
    nectarsourceToGoTo
    number
    personalTime # s
    ploidy
    pollenForager
    pollenLoadSquadron # g
    pollenPellets # g
    pollensourceToGoTo
    speciesID
    speciesName
    spermathecaList
    stage
    thEgglaying
    thForagingNectar
    thForagingPollen
    thNursing
    weight # mg
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
    colonyWeight # mg
    competitionPointDate
    eggDeathsIncubation
    energyNeedToday # kJ
    energyStore # kJ
    eusocialPhaseDate
    idealEnergyStore # kJ
    idealPollenStore # g
    larvaDeathsIncubation
    larvaDeathsWeight
    larvaWorkerRatio
    masterpatchesInRangeList
    masterpatchesWithNectarlayersInFlowerAndRangeList
    masterpatchesWithPollenlayersInFlowerAndRangeList
    nectarInFlowerAndRangeList
    pollenInFlowerAndRangeList
    pollenNeedLarvaeToday # g
    pollenStore # g
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
    summedIncubationToday # kJ
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
  colonyWeight # mg
  competitionPointDate
  eggDeathsIncubation
  energyNeedToday # kJ
  energyStore # kJ
  eusocialPhaseDate
  idealEnergyStore # kJ
  idealPollenStore # g
  larvaDeathsIncubation
  larvaDeathsWeight
  larvaWorkerRatio
  masterpatchesInRangeList
  masterpatchesWithNectarlayersInFlowerAndRangeList
  masterpatchesWithPollenlayersInFlowerAndRangeList
  nectarInFlowerAndRangeList
  pollenInFlowerAndRangeList
  pollenNeedLarvaeToday # g
  pollenStore # g
  pupaDeathsIncubation
  queenProduction::Bool
  queenProductionDate
  queenright::Bool
  speciesIDcolony
  stimEgglaying
  stimNectarForaging
  stimNursing
  stimPollenForaging
  summedIncubationToday # kJ
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
    dev_Q_DeterminationWeight # mg
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
    devIncubation_Q_EmergingTH # kJ
    devIncubation_Q_PupationTH # kJ
    devIncubationEmergingTH # kJ
    devIncubationHatchingTH # kJ
    devIncubationPupationTH # kJ
    devQuotaIncubationToday # kJ
    devWeight_Q_PupationMax_mg
    devWeight_Q_PupationMin # mg
    devWeightEgg_mg
    devWeightPupationMax # mg
    devWeightPupationMin # mg
    emergingDay_mean
    emergingDay_sd
    flightCosts # kJ/m/mg
    flightVelocity # m/s
    growthFactor
    maxLifespanWorkers
    minPollenStore # g
    minToMaxFactor
    name
    nestHabitatsList
    nestSiteArea
    nestsiteFoodsourceList
    pollenToBodymassFactor
    proboscis_max # mm
    proboscis_min # mm
    searchLength # m
    seasonStop
    specMax_cropVolume_myl
    specMax_pollenPellets # g
    timeUnloading
end

struct foodsources
    area # m^2
    colorMemo
    corollaDepth # mm
    cumulNectarVisits
    cumulPollenVisits
    flowerSpecies_relativeAbundanceList
    flowerSpeciesList
    id_Beescout
    interFlowerTime # s
    layersInPatchList
    masterpatch::Bool
    masterpatchID
    nectar # myl
    nectarConcentration # mol/l
    nectarFlowerVolume # myl
    nectarMax # myl
    patchInfo
    patchType
    pollen # g
    pollenMax # g
    proteinPollenProp
    radius # m
    startDay
    stopDay
    farmland::Bool
    stewardshipSpeciesList
    perimeter # m
    occurrence
    cso_area # m^2
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
    perimeter # m
end

struct button
    myLabel
    myCommand
    on::Bool
    exitButton::Bool
    headerButton::Bool
end