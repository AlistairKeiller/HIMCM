# implimentation of https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0247294
using Pkg
Pkg.add("DifferentialEquations")
Pkg.add("ParameterizedFunctions")
Pkg.add("Plots")
Pkg.add("Latexify")
using DifferentialEquations,ParameterizedFunctions,Plots,Latexify

hive = @ode_def begin
    dB = l_0-B/n_B-p_t0*k_NB*iN*B
    diB = -iB/n_B+p_t0*k_NB*iN*B-k_rem*iB*N-k_d*iB
    dN = B/n_B-N/n_N-p_t1*k_RN*iR_1*N-p_trem*k_rem*iB*N
    diN = iB/n_B-iN/n_N+p_t1*k_RN*iR_1*N-k_rem*iN*N+p_trem*k_rem*iB*N-k_d*iN
    dR_0 = N/n_N-R_0/n_R-k_FR*(F_1+iF_1)*R_0+R_1/t_s
    dR_1 = -R_1/n_R+k_FR*(F_1+(1-p_t2)*iF_1)*R_0-R_1/t_s
    diR_0 = iN/n_N-iR_0/n_R-k_FR*(F_1+iF_1)*iR_0+iR_1/t_s
    diR_1 = -iR_1/n_R+k_FR*(F_1+iF_1)*iR_0+p_t2*k_FR*iF_1*R_0-iR_1/t_s
    dF_0 = R_0/n_R-F_0/n_F+k_FR*(R_0+iR_0)*F_1-k_r*F_0
    dF_1 = R_1/n_R-F_1/n_F-k_FR*(R_0+iR_0)*F_1-k_r*F_0
    diF_0 = iR_0/n_R-iF_0/n_F+k_FR*(R_0+iR_0)*iF_1-k_r*iF_0
    diF_1 = iR_1/n_R-iF_1/n_F-k_FR*(R_0+iR_0)*iF_1+p_surv*k_r*iF_0
end l_0 n_B n_N n_R n_F k_NB k_RN k_FR t_s  k_r p_t0 p_t1 p_t2 p_surv k_rem  p_trem k_d
p =[120,20, 10, 11, 14, 0.1, 0.5, 1.44,0.01,0.5,0.3, 0.3, 0.3, 0.0,   2.5e-3,0.0,   0.0]
u_0 = [10000,0,10000,0,0,0,0,0,0,0,0,0]
tspan = (0.0,350.0)

# print(latexify(hive))

prob = ODEProblem(hive,u_0,tspan,p)
sol = solve(prob)

plot(sol)