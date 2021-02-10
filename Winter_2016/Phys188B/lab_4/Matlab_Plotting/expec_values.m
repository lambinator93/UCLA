load pr.dat
load AXr.dat


hold on

plot(pr(:),AXr(:),'b-')
title('Average Displacement X_n: N = 400, l=random','FontSize',14)
xlabel('n','FontSize',14)
ylabel('Average X_n','FontSize',14)
ylim([-50,50])
xlim([-50,50])
hold off


