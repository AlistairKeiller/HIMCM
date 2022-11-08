# old

[old.jl](old.jl) is an implementation of https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0225632&type=printable, where the results in the paper are not reproducible, and the paper seems to have many problems

# new

[new.jl](new.jl) is an implementation of https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0247294 that seems to work. It has the equations:

$$
\begin{align*}
\frac{\mathrm{d} B\left( t \right)}{\mathrm{d}t} =& l_{0} + \frac{ - B\left( t \right)}{n_{B}} - k_{NB} p_{t0} B\left( t \right) \mathrm{iN}\left( t \right) \\
\frac{\mathrm{d} \mathrm{iB}\left( t \right)}{\mathrm{d}t} =& \frac{ - \mathrm{iB}\left( t \right)}{n_{B}} - k_{d} \mathrm{iB}\left( t \right) + k_{NB} p_{t0} B\left( t \right) \mathrm{iN}\left( t \right) - k_{rem} N\left( t \right) \mathrm{iB}\left( t \right) \\
\frac{\mathrm{d} N\left( t \right)}{\mathrm{d}t} =& \frac{ - N\left( t \right)}{n_{N}} + \frac{B\left( t \right)}{n_{B}} - k_{rem} p_{trem} N\left( t \right) \mathrm{iB}\left( t \right) - k_{RN} p_{t1} N\left( t \right) \mathrm{iR}_{1}\left( t \right) \\
\frac{\mathrm{d} \mathrm{iN}\left( t \right)}{\mathrm{d}t} =& \frac{ - \mathrm{iN}\left( t \right)}{n_{N}} + \frac{\mathrm{iB}\left( t \right)}{n_{B}} - k_{d} \mathrm{iN}\left( t \right) - k_{rem} N\left( t \right) \mathrm{iN}\left( t \right) + k_{rem} p_{trem} N\left( t \right) \mathrm{iB}\left( t \right) + k_{RN} p_{t1} N\left( t \right) \mathrm{iR}_{1}\left( t \right) \\
\frac{\mathrm{d} R_{0}\left( t \right)}{\mathrm{d}t} =& \frac{ - R_{0}\left( t \right)}{n_{R}} + \frac{N\left( t \right)}{n_{N}} + \frac{R_{1}\left( t \right)}{t_{s}} - k_{FR} \left( F_{1}\left( t \right) + \mathrm{iF}_{1}\left( t \right) \right) R_{0}\left( t \right) \\
\frac{\mathrm{d} R_{1}\left( t \right)}{\mathrm{d}t} =& \frac{ - R_{1}\left( t \right)}{n_{R}} + \frac{ - R_{1}\left( t \right)}{t_{s}} + k_{FR} \left( \left( 1 - p_{t2} \right) \mathrm{iF}_{1}\left( t \right) + F_{1}\left( t \right) \right) R_{0}\left( t \right) \\
\frac{\mathrm{d} \mathrm{iR}_{0}\left( t \right)}{\mathrm{d}t} =& \frac{ - \mathrm{iR}_{0}\left( t \right)}{n_{R}} + \frac{\mathrm{iN}\left( t \right)}{n_{N}} + \frac{\mathrm{iR}_{1}\left( t \right)}{t_{s}} - k_{FR} \left( F_{1}\left( t \right) + \mathrm{iF}_{1}\left( t \right) \right) \mathrm{iR}_{0}\left( t \right) \\
\frac{\mathrm{d} \mathrm{iR}_{1}\left( t \right)}{\mathrm{d}t} =& \frac{ - \mathrm{iR}_{1}\left( t \right)}{n_{R}} + \frac{ - \mathrm{iR}_{1}\left( t \right)}{t_{s}} + k_{FR} \left( F_{1}\left( t \right) + \mathrm{iF}_{1}\left( t \right) \right) \mathrm{iR}_{0}\left( t \right) + k_{FR} p_{t2} R_{0}\left( t \right) \mathrm{iF}_{1}\left( t \right) \\
\frac{\mathrm{d} F_{0}\left( t \right)}{\mathrm{d}t} =& \frac{ - F_{0}\left( t \right)}{n_{F}} + \frac{R_{0}\left( t \right)}{n_{R}} - k_{r} F_{0}\left( t \right) + k_{FR} \left( R_{0}\left( t \right) + \mathrm{iR}_{0}\left( t \right) \right) F_{1}\left( t \right) \\
\frac{\mathrm{d} F_{1}\left( t \right)}{\mathrm{d}t} =& \frac{ - F_{1}\left( t \right)}{n_{F}} + \frac{R_{1}\left( t \right)}{n_{R}} - k_{r} F_{0}\left( t \right) - k_{FR} \left( R_{0}\left( t \right) + \mathrm{iR}_{0}\left( t \right) \right) F_{1}\left( t \right) \\
\frac{\mathrm{d} \mathrm{iF}_{0}\left( t \right)}{\mathrm{d}t} =& \frac{ - \mathrm{iF}_{0}\left( t \right)}{n_{F}} + \frac{\mathrm{iR}_{0}\left( t \right)}{n_{R}} - k_{r} \mathrm{iF}_{0}\left( t \right) + k_{FR} \left( R_{0}\left( t \right) + \mathrm{iR}_{0}\left( t \right) \right) \mathrm{iF}_{1}\left( t \right) \\
\frac{\mathrm{d} \mathrm{iF}_{1}\left( t \right)}{\mathrm{d}t} =& \frac{ - \mathrm{iF}_{1}\left( t \right)}{n_{F}} + \frac{\mathrm{iR}_{1}\left( t \right)}{n_{R}} + k_{r} p_{surv} \mathrm{iF}_{0}\left( t \right) - k_{FR} \left( R_{0}\left( t \right) + \mathrm{iR}_{0}\left( t \right) \right) \mathrm{iF}_{1}\left( t \right)
\end{align*}
$$
