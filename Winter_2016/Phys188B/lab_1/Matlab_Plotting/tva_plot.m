load tva.dat

loglog(tva(:,1),tva(:,2),'*-')
xlabel('Semi-Major Axis a (in units of a_0)')
ylabel('Orbital Period T (in units 1 / \Omega )')
title('Orbital Period v. Semi-Major Axis on LogLog scale')

fitvars = polyfit(log(tva(:,1)),log(tva(:,2)),1);
m = fitvars(1)
c = fitvars(2)
text(0.5,4,'y = 1.47x + 1.83')