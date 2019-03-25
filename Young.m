%Script to calculate the Young's Modulus for Shale and Limestones
%reservoirs
E = zeros(length(Vp),1);
for i = 1:length(Vp)
    Vp1 = Vp(i);
    poisson1 = poisson(i);
    Dens1 = Dens(i);
    E1 = (((Vp1.^2).*(Dens1*1000).*(1+poisson1).*(1-2*poisson1))./(1-poisson1));
    E(i,1) = E1;
end
E = E/1000000;
USC_limeE = zeros(335,1);%Young;
clear('j');
for j = 1:335;
    E2 = E(j);
    USC_Lime1 = 0.4067*(E2.^0.51);
    USC_limeE(j,1) = USC_Lime1;
end
USC_lime2E = zeros(335,1);%Young;
c = 5167.5:0.5:5514;
E4 = E(336:1029);
clear('j');
for j = 1:length(c);
    E2 = E(j);
    USC_Lime1 = 2.4*(E2.^0.34);
    USC_lime2E(j,1) = USC_Lime1;
end
USC_shaleE = zeros(335,1);%Yound;
g = 5514.5:0.5:6195;
E3 = E(1030:2391);
clear('j');
for j = 1:length(g);
    E2 = E3(j);
    USC_shale1 = 0.0528*(E2.^0.712);
    USC_shaleE(j,1) = USC_shale1;
end
USCE = [USC_limeE;USC_lime2E;USC_shaleE];