clearvars -EXCEPT NBCe1BHAwtIRBIT714182
Data = table2array(NBCe1BHAwtIRBIT714182);
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
ylim([-1000 1000]);
title(Mutation);
xlabel('time(s)');
ylabel('I(nA)');
disp('Please make note of the times that you want the solution change labels at.');
CO2Range = input('Input time 5% CO2 was added and time it was taken away ([t1 t2]): ');
NaRange = input('Input time Na was taken away and time it was returned: ');
co2area = fill([NaRange(1),NaRange(2),NaRange(2),NaRange(1)],[-2000 -2000 800 800],'yellow');
co2area.FaceAlpha = 0.3;
co2area.EdgeColor = 'none';
naline = plot([NaRange(1) NaRange(2)], [800 800],'k-');
naline.LineWidth = 1;
c02line = plot([CO2Range(1) CO2Range(2)],[925 925],'k-','Marker','.');
c02line.LineWidth = 1;
co2label = text(((CO2Range(2)-CO2Range(1))/2)+CO2Range(1),975,'5% CO2','HorizontalAlignment','center');
co2label.FontWeight = 'bold';
nalabel = text(((NaRange(2)-NaRange(1))/2)+NaRange(1),850,'0 Na','HorizontalAlignment','center');
nalabel.FontWeight = 'bold';
