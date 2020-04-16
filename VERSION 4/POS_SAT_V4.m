%Esta funcion calcula las coordenadas en ECEF de cada satélite a lo largo
%de una semana y en distintos intervalos de tiempo, que dependen de como
%hayamos fraccionado el vector t. Lo podemos hacer de segundo en segundo,
%de 2 segundos en 2 segundos... Nos da como resultado la matriz ECEF_P_T
%que contiene las posiciones (x,y,z) de los 24 satélites en cada momento.

%Ground tracking with ECEf coordinates
%keplearian paramiters
function [ECEF_P_T,LLAT_rad]=POS_SAT_V4(t,ephemeris)
format long
%ephemeris[:,1]=(e,~,Inc,omega_rate,s_a,omega,w,M0,~,~)
%esta funcion coge para cada cosa valores de ephemerides e=s(1,1)...
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
longitud=length(t);
ECEF_P_T=zeros(24,3,longitud);
LLAT_rad=zeros(24,2,longitud);
clear longitud
for satt = 1:24
    
e=ephemeris(1,satt);%ECCENTRICITY
Inc=ephemeris(3,satt); %inclinación de la órbita
%omega_rate=ephemeris(4,satt);%(r/s)Rate of Right Ascen
s_a=ephemeris(5,satt); %raiz del semieje
omega=ephemeris(6,satt);%Right Ascen at Week(rad): 
w=ephemeris(7,satt);%Argument of Perigee(rad)
M0=ephemeris(8,satt);%Mean Anomaly(rad)

a=s_a^2;%rad (semieje mayor)
n=sqrt(mu/(a^3));%promedio de mov.calculado


%R=6371000; %m
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



% figure (1)
% title('ORBITS of 30 SATS')
% plot3(xs,ys,zs,'.')
% hold on
ECEF_P_T(satt,1,j)=xs;
ECEF_P_T(satt,2,j)=ys;
ECEF_P_T(satt,3,j)=zs;
end
clear j
% figure(2)
% title('ECEF_P en el tiempo')
% plot(ECEF_P)
% hold on

%finding longitude and latitude
[lon_lat] = ecef22lla(squeeze(ECEF_P_T(satt,:,:)),a,e,t);%Esta e es la excentricidad %VECTOR CON LONGITUD Y LATITUD PARA CADA INSTANTE DE TIEMPO
%TENER CUIDADO AL CAMBIAR EL VECTOR TIEMPO,
%HAY QUE CAMBIARLO DENTRO DE LA FUNCION ecef2lla

% long_latti=lon_lat*180/pi;

LLAT_rad(satt,1,:)=lon_lat(1,:);
LLAT_rad(satt,2,:)=lon_lat(2,:);
%LLAT_deg=LLAT_rad*180/pi;
% figure(3)
% title('Longitutde VS Latitude')
% plot(lon_lat(1,:)*180/pi,lon_lat(2,:)*180/pi,'.')
% hold on
%  hold on
% axis([-180,180,-90,90])
%  hold on

% xlabel('Longitude (\circ)')
% ylabel('Latitude (\circ)')

end
end
