clearvars -except NBCe1BHAN63SIRBIT62518
Data = table2array(NBCe1BHAN63SIRBIT62518);
j = 1;
n = 0;
Mutation = input('Title of your figure: ','s');

for i=1:length(Data)
timelist(j) = Data(i,1);
Ilist(j) = Data(i,2);
    if j == 10
        n = n+1;
        for k = 1:j
            avgtime = sum(timelist)/length(timelist);
            avgI = sum(Ilist)/length(Ilist);
        end
        time(n) = avgtime;
        I(n) = avgI;
    end
j = j+1;
if j > 10
    j = 1;
end
end
hold on
plot(time,I*10^9,'b-')
ylim([-2525 2525]);
title(Mutation);
xlabel('time(s)');
ylabel('I(nA)');
disp('Please make note of the times that you want the solution change labels at.');
ClRange = input('Input time Cl was taken away and time it was returned([t1 t2]): ');
clarea = fill([ClRange(1),ClRange(2),ClRange(2),ClRange(1)],[-2500 -2500 1500 1500],'yellow');
clarea.FaceAlpha = 0.3;
clarea.EdgeColor = 'none';
clline = plot([ClRange(1) ClRange(2)], [1500 1500],'k-');
clline.LineWidth = 1;
cllabel = text(((ClRange(2)-ClRange(1))/2)+ClRange(1),1600,'0 Cl ND96','HorizontalAlignment','center');
cllabel.FontWeight = 'bold';