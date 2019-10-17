%initial vs final comparison


plot(total_output1204(81, :),total_output1204(2,:) , 'x')
grid on

xlabel('Final population')
ylabel('Initial population')
title ('1104 data: Initial vs final population count (each point represents a droplet.')


plot(total_output1104(81, :),total_output1104(2,:) , 'x')


plot(output(2:81, :))