import Pkg; Pkg.add("DifferentialEquations")
using DifferentialEquations

# implimentation of https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0247294

# Egg-laying rate
l_0 = 120
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
p_trem = 0.0
# Disease-related death rate of infected bees
k_d = 0.0

# u = (B, iB, N, iN, R_0, R_1, iR_0, iR_1, F_0, F_1, iF_0, i_F1)
#     (1, 2,  3, 4,  5,   6,   7,    8,    9,   10,  11,   12)
function hive(du, u, p, t)
    B, iB, N, iN, R_0, R_1, iR_0, iR_1, F_0, F_1, iF_0, iF_1 = u
    du[1] = l_0-B/n_B-p_t0*k_NB*iN*B
    du[2] = -iB/n_B+p_t0*k_NB*iN*B-k_rem*iB*N-k_d*iB
    du[3] = B/n_B-N/n_N-p_t1*k_RN*iR_1*N-p_trem*k_rem*iB*N
    # The paper says B_i, but it seems like they meant iB
    du[4] = iB/n_B-iN/n_N+p_t1*k_RN*iR_1*N-k_rem*iN*N+p_trem*k_rem*iB*N-k_d*iN
    du[5] = N/n_N-R_0/n_R-k_FR*(F_1+iF_1)*R_0+R_1/t_s
    du[6] = -R_1/n_R+k_FR*(F_1+(1-p_t2)*iF_1)*R_0-R_1/t_s
    du[7] = iN/n_N-iR_0/n_R-k_FR*(F_1+iF_1)*iR_0+iR_1/t_s
    du[8] = -iR_1/n_R+k_FR*(F_1+iF_1)*iR_0+p_t2*k_FR*iF_1*R_0-iR_1/t_s
    du[9] = R_0/n_R-F_0/n_F+k_FR*(R_0+iR_0)*F_1-k_r*F_0
    du[10] = R_1/n_R-F_1/n_F-k_FR*(R_0+iR_0)*F_1-k_r*F_0
    du[11] = iR_0/n_R-iF_0/n_F+k_FR*(R_0+iR_0)*iF_1-k_r*iF_0
    du[12] = iR_1/n_R-iF_1/n_F-k_FR*(R_0+iR_0)*iF_1+p_surv*k_r*iF_0
end

u_0 = [0,0,0,0,0,0,0,0,0,0,0,0]
tspan = (0.0,350.0)

prob = ODEProblem(hive,u_0,tspan)
sol = solve(prob)

import Pkg; Pkg.add("Plots")
using Plots

plot(sol)