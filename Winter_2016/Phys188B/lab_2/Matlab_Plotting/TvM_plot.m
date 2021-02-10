load TvM_hope.dat

plot(TvM_hope(:,1),TvM_hope(:,2))
fitvars = polyfit(TvM_hope(:,1), TvM_hope(:,2), 1)
m = fitvars(1)
c = fitvars(2)
title({'Crank-Nicolson Computation Time versus System Size:','T v. M: r = 1'}, 'FontSize', 12)
xlabel('System Size - M ','FontSize', 12)
ylabel('Computation Time - T (s)', 'FontSize', 12)
text(350, 8*10^-3, 'T = 1.01e-05M + 1.47e-04', 'FontSize', 12) 