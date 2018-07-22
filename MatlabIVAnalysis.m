%%Import IV's with titles ND96, Na, and CO2 as the variable names with
%%respect to the solutions
hold on
titleIV = input('What is the title of your IV? ','s');
for u = 1:2
clearvars -except ND96 && Na && CO2 && u && titleIV && g && ND96Data
ND96Data = table2array(ND96);
if u == 1
    IVData = table2array(CO2);
    plot(IVData(:,1)*10^3,(IVData(:,2)-ND96Data(:,2))*10^6,'-rp')
elseif u == 2
    IVData = table2array(Na);
    plot(IVData(:,1)*10^3,(IVData(:,2)-ND96Data(:,2))*10^6,'-bs')
end
title(titleIV);
xlabel('mV')
ylabel('I(\mu A)')
legend('5% CO2','0 Na')

V1 = -0.02;
V2 = -0.06;
j = 1;
n = 1;
for i = 1:length(IVData)
    if IVData(i,1) == V1
        xval1(j) = IVData(i,1);
        yval1(j) = IVData(i,2);
        j = j+1;
        V1 = V1+0.02;
    end
    if V1 > 0.02
        break;
    end
end
for m = 1:length(IVData)
    if IVData(m,1) >= V2 || IVData(m,1) > V2-0.001
        xval2(n) = IVData(m,1);
        yval2(n) = IVData(m,2);
        n = n+1;
        V2 = V2+0.02;
    end
    if V2 > 0.001
        break;
    end
end

if u ==1
    disp('5% CO2')
elseif u ==2
    disp('0 Na')
end

p1 = polyfit(xval1,yval1,1);
p2 = polyfit(xval2,yval2,1);
g(u+1,:) = [p1(1) p2(1)];

disp(['Conductance -20mV-20mV (Siemens): ' num2str(p1(1))])
disp(['Conductance -60mV-0mV (Siemens): ' num2str(p2(1))])

 
end
IVData = table2array(ND96);
V1 = -0.02;
V2 = -0.06;
j = 1;
n = 1;
for i = 1:length(IVData)
    if IVData(i,1) == V1
        xval1(j) = IVData(i,1);
        yval1(j) = IVData(i,2);
        j = j+1;
        V1 = V1+0.02;
    end
    if V1 > 0.02
        break;
    end
end
for m = 1:length(IVData)
    if IVData(m,1) >= V2 || IVData(m,1) > V2-0.001
        xval2(n) = IVData(m,1);
        yval2(n) = IVData(m,2);
        n = n+1;
        V2 = V2+0.02;
    end
    if V2 > 0.001
        break;
    end
end

disp('ND96')

p1 = polyfit(xval1,yval1,1);
p2 = polyfit(xval2,yval2,1);
g(1,:) = [p1(1) p2(1)];
