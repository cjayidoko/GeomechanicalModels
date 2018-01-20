%Script to model the variation of pressure with depth in a cratonic lithos.
%Assumes density of crust, rhoC = 2800kg/m^3 and density of mantle rhoM =
%3200 kg/m^3. Petrologic crust-mantle boundary is assumed to be 40 km.
%also models the variation of Curie-Temperature with pressure in the subsurface;
%By C. Idoko (2016)

%Grid for depth
z1 = 0:1:39999;%depth from surface to base of crust assuming a ptrologic depth of 40km;
z2 = 40000:1:100000;%depth from base of crust to 150km depth;
n1 = length(z1);
n2 = length(z2);
%Predefines pressure
Pc = zeros(1,n1);%predefines pressure for crust;
Pm = zeros(1,n2);%predefines pressure for mantle;

%A loop to calculate pressure for crust and mantle separately;
for i = 1:length(z1)
    pc = 2800*9.81*z1(i);
    Pc(1,i) = pc;
     for k = 1:length(z2)
        pm = 3200*9.81*(z2(k)-40000)+2800*9.81*40000;
        Pm(1,k) = pm;
     end
end

%Post-processing of results;
p = [Pc,Pm];%combines the pressure with crustal density and pressure at mantle density;
p = p/10e7;%to convert the pressure to kilobars;

%Modelling the variation of Curie-Temperature with pressure in the subsurface;
%Tc = 575+((2.05).*p) (from Schultz (1970));
Tc = 575+((2.05).*p);

%Visualization of results;
figure(4)
z = 0:1:150000;%depth to 150km;
plot(p,z/1000)
set(gca, 'Ydir', 'reverse')
xlabel('Presure[kbars]','FontSize',28,'FontWeight','bold'),ylabel('Depth(km)','FontSize',28,'FontWeight','bold')
figure(5)
plot(Tc,z/1000)
set(gca, 'Ydir', 'reverse')
xlabel('Temperature(deg-C)','FontSize',28,'FontWeight','bold'),ylabel('Depth(km)','FontSize',28,'FontWeight','bold')
