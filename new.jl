# implimentation of https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0247294

# Egg-laying rate
l_0 = 2000
# Days in brood class
n_B = 20
# Days in nurse class
n_N = 10
# Days in nectar-receiver class
n_R = 11
# Days in forager class
n_F = 14
# Contact rate between nurse bees and brood
k_NB = 0.1
# Contact rate between nectar-receiver and nurse bees
k_RN = 0.5
# Contact rate between foragers and nectar-receivers
k_FR = 1.44
# Duration of a storage cycle
t_s = 0.01
# Rate of nectar-collecting
k_r = 0.5
# Probability of disease transmission per contact
p_t0 = 0.3
p_t1 = 0.3
p_t2 = 0.3
# Probability of infected foragers to return home
p_surv = 0.0
# Rate of infected bee removal by healthy nurses
k_rem = 2.5e-3
# Probability of healthy nurses being infected from infected brood during performing hygienic removal
p_t,rem = 0.0
# Disease-related death rate of infected bees
k_d = 0.0

# B0 ¼ l0   B
# nB
#   pt0 � kNB � iN � B ð1Þ
# iB0 ¼   iB
# nB
# þ pt0 � kNB � iN � B   krem � iB � N   kd � iB ð2Þ
# N0 ¼ B
# nB
#   N
# nN
#   pt1 � kRN � iR1 � N   pt;rem � krem � iB � N ð3Þ
# iN0 ¼ Bi
# nB
#   iN
# nN
# þ pt1 � kRN � iR1 � N   krem � iN � N þ pt;rem � krem � iB � N   kd � iN ð4Þ

# u = (B, iB, N, iN)
function hive(du, u, p, t)
    B, iB, N, iN = u
    du[1] = l_0-B/n_B-p_t0*k_NB*iN*B
    
end