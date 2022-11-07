# implimentation of https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0225632&type=printable

import Pkg; Pkg.add("DifferentialEquations")
using DifferentialEquations

# rate of egg-laying by the queen
L = 2000
# number of hive bees for 50% egg survival
v = 5000
# mass of nectar stored for 50% egg survival
b = 500
# The minimum probability that a hive bee is recruited to become a pollen forager
min_p = 0.25
# The maximum probability that a hive bee is recruited to become a pollen forager
max_p = 0.25
# The minimum probability that a hive bee is recruited to become a nectar forager
min_n = 0.25
# The maximum probability that a hive bee is recruited to become a nectar forager
max_n = 0.25
# effect of excess foragers on recruitment
δ = .75
# pupation rate of uncapped brood that changes to pupae per day
p_o = 1/9
# pupation rate of capped brood that changes to bee per day
p_c = 1/12
# daily nectar requirement per uncapped brood
N_o = 0.018
# daily pollen requirement per uncapped brood
P_o = 0.018
# daily nectar requirement per adult bee
N_A = 0.007
# daily pollen requirement per hive bee
P_H = 0.007
# food gathered per day per forager
c = 0.1
# mortality rate of pollen forgers
m_p = 0.3
# mortality rate of nectar forgers
m_n = 0.3
# mortality of capped broods
m_c = 0.06
# the maximum amount of pollen that can be consumed by a hive bee as a food to be saturated
K = 8

# The survival function
S(H, f_p, f_n) = (H/(H+v))*(f_n/(f_n+b))*(f_p^2/(f_p^2+K*H))
# The pollen recruitment function
R_p(H, F_p, F_n, f_p) = min_p+max_p*(1-f_p^2/(f_p^2+K*H))-δ*(F_p/(F_p+F_n+H))
# The nectar recruitment function
R_n(H, F_p, F_n, f_n) = min_n+max_n*(1-f_n/(f_n+b))-δ*(F_n/(F_p+F_n+H))
# The change of availability of pollen in a year
μ_p(t) = 0.5*(sin(π*t/180+π/2)+2.5)
# The change of availability of nectar in a year
μ_n(t) = 0.5*(sin(π*t/180)+5.5)

# u = (B_o, B_c, H, F_p, F_n, f_p, f_n)
# B_o ( u[1] ) is the number of uncapped brood
# B_c ( u[2] ) is the number of capped brood
# H   ( u[3] ) is the number of hive bees
# F_p ( u[4] ) is the number pollen forgers
# F_n ( u[5] ) is the number nectar forgers
# f_p ( u[6] ) is the amount of pollen stored
# f_n ( u[7] ) is the amount of nectar stored
function hive(du, u, p, t)
    B_o, B_c, H, F_p, F_n, f_p, f_n = u
    du[1] = L*S(H, f_p, f_n)-p_o*B_o
    du[2] = p_o*B_o-p_c*B_c-m_c*B_c
    du[3] = p_c*B_c-H*R_p(H, F_p, F_n, f_p)-H*R_n(H, F_p, F_n, f_n)
    du[4] = H*R_p(H, F_p, F_n, f_p)-m_p*F_p
    du[5] = H*R_n(H, F_p, F_n, f_n)-m_n*F_n
    du[6] = μ_p(t)*c*F_p-P_o*B_o-P_H*H
    du[7] = μ_n(t)*c*F_n-P_o*B_o-N_A*(H+F_p+F_n)
end

u_0 = [1000,1000,1000,1000,1000,1000,1000]
tspan = (0.0,1000.0)

prob = ODEProblem(hive,u_0,tspan)
sol = solve(prob)

import Pkg; Pkg.add("Plots")
using Plots

plot(sol, title = "Bee Thing", label=["B_o" "B_c" "H" "F_p" "F_n" "f_p" "f_n"])