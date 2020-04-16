%Ground tracking with ECEf coordinates
%keplearian paramiters
%S1=[0.5968570709e-002 589824.0000 0.9651879023 -0.7840326581E-008 5153.653320 0.1489908052E+001 0.563527841 -0.1208933779E+001 0.3814697266E-004 0.0000000000E+000];
%function [ECEF_P_T,LLAT_rad,LLAT_deg]=Marzo19_Pos_Sat(t,et,ephemeris)
%ephemeris[:,1]=(e,~,Inc,omega_rate,s_a,omega,w,M0,~,~)
%esta funcion coge para cada cosa valires de ephemerides e=s(1,1)...
%e=0.5968570709E-002;
%Time of Applicability(s):  589824.0000
%Inc=          0.9651879023; %(rad)
%omega_rate=  -0.7840326581E-008; %(r/s)Rate of Right Ascen(r/s)
%s_a=          5153.653320;   %(m 1/2)
%omega=0.1489908052E+001; %(rad)Right Ascen at Week(rad): 
%w=   0.563527841;%(rad)Argument of Perigee(rad)
%M0=-0.1208933779E+001;%(rad)
%Af0(s):                     0.3814697266E-004
%Af1(s/s):                   0.0000000000E+000
%week:                        895
mu=3.986005*10^14;%WGS 84 ES EL PARAMETRO UNIVERSAL DE LA GRAVITACIÓN
for satt = 1:24
    
e=ephemeris(1,satt);%ECCENTRICITY
Inc=ephemeris(3,satt); %inclinación de la órbita
omega_rate=ephemeris(4,satt);%(r/s)Rate of Right Ascen
s_a=ephemeris(5,satt); %raiz del semieje
omega=ephemeris(6,satt);%Right Ascen at Week(rad): 
w=ephemeris(7,satt);%Argument of Perigee(rad)
M0=ephemeris(8,satt);%Mean Anomaly(rad)

a=s_a^2;%rad (semieje mayor)
n=sqrt(mu/(a^3));%promedio de mov.calculado
et=24*60*60*7;%(s)
t=0:3600:et;%time vector,here 600s represent 10 minutes
%t=0:60:et;

R=6371000; %m
for j = 1:length(t)
    

difference=100;
threshold=0.001;
Mold=M0+n*t(j);%algo en radianes que se va incrementando en cada unidad de tiempo
Enew=Mold;

while (difference>threshold)
   Eold=Enew;
   Enew=Eold-((Eold-e*sin(Eold)-Mold)/(1-e*cos(Eold)));
   Mnew=Enew-(e*sin(Enew));
   difference=abs(Mnew-Mold);
end
%Enew(j)=Enew;

%true anomly
Vu=2*atan(sqrt((1-e)/(1+e))*tan(Enew/2));

rk=a*(1-e*cos(Enew));

ik=Inc; %angle of inclination

xp=rk*cos(Vu+w);%x position in plane

yp=rk*sin(Vu+w);%y position in plane

xs=xp*cos(omega)-yp*cos(ik)*sin(omega);% ECEf x postion

ys=xp*sin(omega)+yp*cos(ik)*cos(omega);% ECEF y postion

zs=yp*sin(ik);% ECEF z postion

%AQUÍ ABAJO ESTAN LAS VARIABLES QUE CONTIENEN POSICIONES DE SATÉTILES ANTES
%DE JUNTARLAS EN ECEF_P_T
% ECEF_P(1,j)=xs;
% ECEF_P(2,j)=ys;
% ECEF_P(3,j)=zs;
% ECEF_Px(1,j)=ECEF_P(1,j);
% ECEF_Py(1,j)=ECEF_P(2,j);
% ECEF_Pz(1,j)=ECEF_P(3,j);

figure (1)
title('ORBITS of 30 SATS')
plot3(xs,ys,zs,'.')
hold on
ECEF_P_T(satt,1,j)=xs;
ECEF_P_T(satt,2,j)=ys;
ECEF_P_T(satt,3,j)=zs;
end
clear j
figure(2)
title('ECEF_P en el tiempo')
plot(ECEF_P)
hold on

%finding longitude and latitude
[lon_lat] = ecef22lla(ECEF_P,a,e,t,et);%VECTOR CON LONGITUD Y LATITUD PARA CADA INSTANTE DE TIEMPO
%TENER CUIDADO AL CAMBIAR EL VECTOR TIEMPO,
%HAY QUE CAMBIARLO DENTRO DE LA FUNCION ecef2lla

long_latti=lon_lat*180/pi;

LLAT_rad(satt,1,:)=lon_lat(1,:);
LLAT_rad(satt,2,:)=lon_lat(2,:);
LLAT_deg=LLAT_rad*180/pi;
% figure(3)
% title('Longitutde VS Latitude')
% plot(lon_lat(1,:)*180/pi,lon_lat(2,:)*180/pi,'.')
% hold on
%  hold on
% axis([-180,180,-90,90])
%  hold on

% xlabel('Longitude (\circ)')
% ylabel('Latitude (\circ)')
%ECEF_P_T(satt,); %esta es la posicion de un satélite en el instante de tiempo requerido
end
