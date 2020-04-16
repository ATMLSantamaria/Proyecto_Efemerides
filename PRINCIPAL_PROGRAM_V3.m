close all
%clc
clear
format long
%%dato intervalo tiempo
et=24*60*60*7;%(s) segundos en una semana
%t=0:600:et;%time vector,here 600s represent 10 minutes
t=0:4:et;%ahora mismo se genera la posicion cada 1 segundos
%%%
coordenadasurgel=[42,1,800];
[c_efef_urgel,cpx_u,cpy_u,cpz_u ] = ecef_ruta( coordenadasurgel );
% disp('Si quiere introducir el tiempo parametro a parametro pulse 1')
% disp('Si quiere introducirlo en formato dia:hora:minuto:segundo pulse 2')
% a=input('Si quiere introducirlo en segundos desde el inicio de semana pulse 3');
% if a==1
%     dia=input('Introduzca dia de la semana');
%     hora=input('introduzca hora del dia');
%     minuto=input('introduzca minuto');
%     segundo=input('introduzca segundo');
%     tiempo=calculo_tiempo(dia,hora,minuto,segundo)
% elseif a==2
%     ttiempo=[]
%     ttexto=input('Introduzca en formato dia:hora:minuto:segundo','s')
%     tiempo = cadena2tiempo(ttexto)
% 
% else
%     tiempo=input('Introduzca tiempo en segundos')
% end
%     
tiempo=3;
%
%tiempo=7564 % s %momento en el que queremos la posicion de los satelites
RE=6378000;
h = waitbar(0,'POSICIONANDO SATELITES ');
tic;
filename='almanac.xlsx';
%aqui estan los datos de un almanac cualquiera, lo primero es conseguir
%leer el de una semana cualquiera
%S1=[eccentricity, time of applicability, orbital inclinatione, rate of right ascen, sqrt(a),Right Ascen at Week(rad),Argument of Perigee(rad),Mean Anom(rad),Af0(s),Af1(s/s):]
%%%
%FUNCION QUE LEE LOS ALMANACS Y DEVUELVE LOS VALORES DE CADA SATELITE
%%%
[ephemeris ] = readalmanac2( filename );
%S1=[0.7673263550E-002 319488.0000 0.9709403302 -0.7600316584E-008 5153.625000 -0.2248200894E+001 0.617448614 -0.1840900533E+001 -0.4482269287E-004 -0.3637978807E-011];

%%Orbits and ground tracking


%Aqui calculo las coordenadas ECEF de cada satelite. EN EL FUTURO LO METERE EN UNA FUNCION

[ECEF_P_T,LLAT_rad,LLAT_deg]=POS_SAT_V2(t,et,ephemeris);
%%%
%FUNCION QUE GENERA LAS GRAFICAS, NO SIRVE DE CARA AL PROYECTO EN SI, PERO
%ES MAS VISUAL
%%%
graficas2(ECEF_P_T,RE)
%%%
%SIGUIENTE PASO: PENSAR EN UNA FORMA INTRODUCIR UN TIEMPO CONCRETO Y QUE EL
%PROGRAMA VAYA A LOS VECTORES Y ELIJA LOS VALORES CORRECTOS DE CADA
%UNA VEZ TENGA ESO EL SIGUIENTE PASO SERA DECIDIR QUE SATELITES ESTAN POR
%ENCIMA DEL PLANO DEL HORIZONTE DE UN PUNTO Y ESTUDIAR SOLO ESOS SATELITES
%%%
ECEF_P_T_tiempo=squeeze(ECEF_P_T(:,:,tiempo));
%matrizsatelites=ECEF_P_T_tiempo; %Esto es lo verdadero, aunque hay que
%resolver la discrepancia de por que hay una diferencia del 0,05%
%calculando de una forma y de otra

%EN MATRIZ SATELITES TENEMOS LAS POSITIONES EN EL 
%TIEMPO definido DE LOS 24 SATELITES

%graficas2(); AQUI ME GUSTARIA REPRESENTAR LA POSICION CON UN PUNTO DE CADA
%SATELITE
%PS1_lla=ecef2lla(PS1); %calcula usando el aerospace toolbox latitude, longitude and altitude

%%Aqui se calcula la visibilidad
[ geometria,tan2,dis_sat_flat2 ] = geometry2(c_efef_urgel ,ECEF_P_T_tiempo );





sat_vis=dis_sat_flat2>0; %matriz logica con 1 en los satelites visibles
index_sat_vis=find(sat_vis); %devuelve los indices de los satelites visibles
num_sat_vis=size(index_sat_vis) ;%numero de satelites
% matriz_satelites_sobreplano=matrizsatelites(indice_satelites_visibles,:)%en esta matriz meto los satelites sobre el plano en el momento de tiempo pedido
toc;
close(h);