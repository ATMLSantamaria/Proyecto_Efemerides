close all
%clc
clear
format long
%%dato intervalo tiempo
et=24*60*60*7;%(s) segundos en una semana
%t=0:600:et;%time vector,here 600s represent 10 minutes
t=0:4:et;%ahora mismo se genera la posicion cada 4 segundos
clear et
rad2deg=180/pi;
deg2rad=pi/180;
%%%
%coordenadasurgel=[42,1,800];
coordenadasurgel=[28,-16,800];
[c_efef_urgel ] = ecef_ruta4( coordenadasurgel );
clear coordenadasurgel

tiempo=1;

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
[ephemeris ] = readalmanac4( filename );
clear filename

%%Orbits and ground tracking


%Aqui calculo las coordenadas ECEF de cada satelite. EN EL FUTURO LO METERE EN UNA FUNCION

[ECEF_P_T,LLAT_rad]=POS_SAT_V4(t,ephemeris);
%%%
%FUNCION QUE GENERA LAS GRAFICAS, NO SIRVE DE CARA AL PROYECTO EN SI, PERO
%ES MAS VISUAL
%%%
%graficas4(ECEF_P_T,RE)
clear RE
%%%
%SIGUIENTE PASO: PENSAR EN UNA FORMA INTRODUCIR UN TIEMPO CONCRETO Y QUE EL
%PROGRAMA VAYA A LOS VECTORES Y ELIJA LOS VALORES CORRECTOS DE CADA
%UNA VEZ TENGA ESO EL SIGUIENTE PASO SERA DECIDIR QUE SATELITES ESTAN POR
%ENCIMA DEL PLANO DEL HORIZONTE DE UN PUNTO Y ESTUDIAR SOLO ESOS SATELITES
%%%
ECEF_P_T_tiempo=squeeze(ECEF_P_T(:,:,tiempo));


%EN ECEF_P_T_tiempo TENEMOS LAS POSITIONES EN EL 
%TIEMPO definido DE LOS 24 SATELITES

%graficas2(); AQUI ME GUSTARIA REPRESENTAR LA POSICION CON UN PUNTO DE CADA
%SATELITE
%PS1_lla=ecef2lla(PS1); %calcula usando el aerospace toolbox latitude, longitude and altitude

%%Aqui se calcula la visibilidad
[ geometria,alfa_rad2,dis_sat_flat2 ] = geometry4(c_efef_urgel ,ECEF_P_T_tiempo );

[ geometriatotal,alfa_rad_total1,dis_sat_flat_total1 ] = totalgeometry4( c_efef_urgel,ECEF_P_T,t );




%%
%%Aqui calculo la cantidad de veces que se repite una visibilidad
%%determinada usando distancia satelite-planotangente
indice_satelites_visibles_total=dis_sat_flat_total1>0;
numero_satelites_visibles_total=sum(indice_satelites_visibles_total,1);
for i=1:24
b=size(find(numero_satelites_visibles_total==i));
visibilidades(i,1)=b(2);
end
clear i
%%Aqui calculo la cantidad de veces que se repite una visibilidad
%%determinada usando angulo
indice_satelites_visibles_total2=alfa_rad_total1*rad2deg>10;
numero_satelites_visibles_total2=sum(indice_satelites_visibles_total2,1);
for i=1:24
b=size(find(numero_satelites_visibles_total2==i));
visibilidades2(i,1)=b(2);
end
clear b

%%
%%Aqui calculo una matriz con las posiciones x,y,z exclusivamente de los
%%satelites visibles EN UN MOMENTO EN EL TIEMPO usando la distancia
%%satelite-planotangente. 

dis_sat_flat2=dis_sat_flat2';
vis=dis_sat_flat2>0;
pos=find(vis);
ecef_sat_vis=ECEF_P_T_tiempo(pos,:);

%%Aqui calculo una matriz con las posiciones x,y,z exclusivamente de los
%%satelites visibles EN UN MOMENTO EN EL TIEMPO usando el ángulo.Uso un angulo de mascara de 5


alfa_rad2=alfa_rad2';
vis2=alfa_rad2*rad2deg>5;
pos2=find(vis2);
ecef_sat_vis2=ECEF_P_T_tiempo(pos2,:);


%%
%%aqui he conseguido reordenar ECEF_P_T para despues poder seleccionar los
%%indices visibles
ECEF_P_T_ordenada=permute(ECEF_P_T,[1,3,2]);
prueba=squeeze(ECEF_P_T_ordenada(:,1,:));

% %%
% %AQUI VOY A CALCULAR LA MATRIZ CON LAS POSICIONES X,Y,X DE LOS SATELITES
% %VISIBLES EN TODOS LOS MOMENTOS DEL TIEMPO
% ecef_sat_vis_all=[]
% for ciclo=1:length(t)
%     ecef_sat_vis_all=[ecef_sat_vis_all,]
% end
% dis_sat_flat_total1;
% vis_all=dis_sat_flat_total1>0;
% [I,J,V]=find(vis_all);
% for cuenta=1:60481
%     ecef_sat_vis_all=ECEF_P_T_ordenada(I(cuenta),:,:);
% end
% %pos_all=find(vis_all);
% %ecef_sat_vis_all=ECEF_P_T_ordenada(I,:,:);
%%


%%
%%> ECEF_P_T(vis_all,:);



close(h)

toc;
