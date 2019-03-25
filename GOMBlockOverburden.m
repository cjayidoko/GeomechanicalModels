%Script to model the overburden pressure in the Gulf of Mexico
z1 = 1:1:1000;%depth from base of crust to 1000km (ist section) depth;
z2 = 1001:1:3515;% second section;
%n = length(z);
z3 = 3516:1:7000;%3rd
z4 = 7001:1:10000;%4th
z5 = 10001:1:13101;%5th
n1 = length(z1);
n2 = length(z2);
n3 = length(z3);
n4 = length(z4);
n5 = length(z5);
Pc = zeros(1,n1);%predefines pressure-section 1;
Pm1 = zeros(1,n2);%predefines pressure;
Pm2 = zeros(1,n3);
Pm3 = zeros(1,n4);
Pm4 = zeros(1,n5);
for i = 1:length(z1);
    pc = 1000*9.81*z1(i)*0.3048;%computes pressure for each depth b4 40km;
    Pc(1,i) = pc;%Stores the results of pc;
end
for k = 1:length(z2);
     pm1 = 1800*9.81*(z2(k)-1001)*0.3048+1000*9.81*1001*0.3048;%;
     Pm1(1,k) = pm1;%Stores pm;
end
for m = 1:length(z3)
     pm2 = (1000*2.1863)*9.81*(z3(m)-3516)*0.3048+1800*9.81*3516*0.3048;%section 3;
     Pm2(1,m) = pm2;
end
for n = 1:length(z4)
     pm3 = (1000*2.2697*9.81*(z4(n)-7001)*0.3048)+2186.3*9.81*7001*0.3048;%section 4;
     Pm3(1,n) = pm3;
end
for l = 1:length(z5)
     pm4 = (1000*2.3876*9.81*(z5(l)-10001)*0.3048)+2269.7*9.81*10001*0.3048;%section 5;
     Pm4(1,l) = pm4;
end
P = [Pc,Pm1,Pm2,Pm3,Pm4];%combines the pressure from different sections;
p = P*0.000145038;%to convert the pressure to kilobars;
Phydro = 1000*9.81*Depthft1*0.3048*0.000145038;
figure(24)
hold on
plot(Phydro,Depthft1)
plot(p,Depthft1)
set(gca,'Ydir','reverse')
set(gca, 'XAxisLocation', 'top')
xlabel('Stress[psi]','FontSize',28,'FontWeight','bold'),ylabel('Depth(ft)','FontSize',28,'FontWeight','bold')
figure(25)
plot(P,Depthft1)
set(gca,'Ydir','reverse')
set(gca, 'XAxisLocation', 'top')
xlabel('Stress[N/m2]','FontSize',28,'FontWeight','bold'),ylabel('Depth(ft)','FontSize',28,'FontWeight','bold')