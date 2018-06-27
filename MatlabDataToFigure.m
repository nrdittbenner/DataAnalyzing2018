clearvars -except NBCe1BHAN635IRBIT626182
Data = table2array(NBCe1BHAN635IRBIT626182);
j = 1;
n = 0;
m = 1;
w = 1;
o = 1;
y = 1;
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
NumberChanges = input('How many solution changes? ');
for q = 1:NumberChanges
    disp(['Solution Change: ',num2str(q)]);
    soln{q} = input('Name of solution: ','s');
    tpoint(q) = input('Time of solution change? ');
    
end
for p = 1:length(Data)
    if Data(p,1) > tpoint(y)
        Ipoint(y) = Data(p,2);
        y = y+1;
    end
    if y > NumberChanges
        break;
    end
end

for l=1:NumberChanges
    txt = soln{l};
    solutionlabels = text(tpoint(l),(Ipoint(l)*10^9)-200,txt);
    solutionlabels.FontWeight = 'bold';
    solutionlabels.BackgroundColor = 'y';
end
option = input('Labels in the right place? (if no, close the figure) ','s');
if isequal(option,'no')
    for h = 1:NumberChanges
        disp(['Label: ', num2str(h)]);
        move = input('How many seconds over? ');
        tpoint(h) = tpoint(h)+move;
    end
    plot(time,I*10^9,'b-')
    ylim([-2525 2525]);
    title(Mutation);
    xlabel('time(s)');
    ylabel('I(nA)');
    for l=1:NumberChanges
        txt = soln{l};
        solutionlabels = text(tpoint(l),(Ipoint(l)*10^9)-200,txt);
        solutionlabels.FontWeight = 'bold';
        solutionlabels.BackgroundColor = 'y';
    end
end
