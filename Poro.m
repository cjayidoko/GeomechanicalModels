%%%Script to compute the porosity of shale 
c = 5000:0.5:5514;
USC_limeP = zeros(length(c),1);
for i = 1:length(c);
    po = Po(i);
    USC_LimeP1= 135.9*exp(-4.8*po);
    USC_limeP(i,1) = USC_LimeP1;
end
g = 5514.5:0.5:6195;
Po3 = Po(1030:2391);
USC_shaleP = zeros(length(Po3),1);
for j = 1:length(g);
    Po2 = Po3(j);
    USC_shalep1 = 1.001*Po2^(-1.143);
    USC_shaleP(j,1) = USC_shalep1;
end
USCP = [USC_limeP;USC_shaleP];