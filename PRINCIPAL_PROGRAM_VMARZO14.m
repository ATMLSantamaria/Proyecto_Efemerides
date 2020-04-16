close all
%clc

format long
%%dato intervalo tiempo
et=24*60*60*7;%(s) segundos en una semana
%t=0:600:et;%time vector,here 600s represent 10 minutes
t=0:1:et;%ahora mismo se genera la posicion cada 1 segundos
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
tiempo=169;
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
[S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,ephemeris ] = readalmanac( filename );
%S1=[0.7673263550E-002 319488.0000 0.9709403302 -0.7600316584E-008 5153.625000 -0.2248200894E+001 0.617448614 -0.1840900533E+001 -0.4482269287E-004 -0.3637978807E-011];

%%Orbits and ground tracking


%Aqui calculo las coordenadas ECEF de cada satelite. EN EL FUTURO LO METERE EN UNA FUNCION

[ECEF_Px_s1,ECEF_Py_s1,ECEF_Pz_s1,long_s1,latti_s1]=posicionsatelites(t,et,S1(1,1),S1(1,2),S1(1,3),S1(1,4),S1(1,5),S1(1,6),S1(1,7),S1(1,8),S1(1,9),S1(1,10));
[ECEF_Px_s2,ECEF_Py_s2,ECEF_Pz_s2,long_s2,latti_s2]=posicionsatelites(t,et,S2(1,1),S2(1,2),S2(1,3),S2(1,4),S2(1,5),S2(1,6),S2(1,7),S2(1,8),S2(1,9),S2(1,10));
[ECEF_Px_s3,ECEF_Py_s3,ECEF_Pz_s3,long_s3,latti_s3]=posicionsatelites(t,et,S3(1,1),S3(1,2),S3(1,3),S3(1,4),S3(1,5),S3(1,6),S3(1,7),S3(1,8),S3(1,9),S3(1,10));
[ECEF_Px_s4,ECEF_Py_s4,ECEF_Pz_s4,long_s4,latti_s4]=posicionsatelites(t,et,S4(1,1),S4(1,2),S4(1,3),S4(1,4),S4(1,5),S4(1,6),S4(1,7),S4(1,8),S4(1,9),S4(1,10));
[ECEF_Px_s5,ECEF_Py_s5,ECEF_Pz_s5,long_s5,latti_s5]=posicionsatelites(t,et,S5(1,1),S5(1,2),S5(1,3),S5(1,4),S5(1,5),S5(1,6),S5(1,7),S5(1,8),S5(1,9),S5(1,10));
[ECEF_Px_s6,ECEF_Py_s6,ECEF_Pz_s6,long_s6,latti_s6]=posicionsatelites(t,et,S6(1,1),S6(1,2),S6(1,3),S6(1,4),S6(1,5),S6(1,6),S6(1,7),S6(1,8),S6(1,9),S6(1,10));
[ECEF_Px_s7,ECEF_Py_s7,ECEF_Pz_s7,long_s7,latti_s7]=posicionsatelites(t,et,S7(1,1),S7(1,2),S7(1,3),S7(1,4),S7(1,5),S7(1,6),S7(1,7),S7(1,8),S7(1,9),S7(1,10));
[ECEF_Px_s8,ECEF_Py_s8,ECEF_Pz_s8,long_s8,latti_s8]=posicionsatelites(t,et,S8(1,1),S8(1,2),S8(1,3),S8(1,4),S8(1,5),S8(1,6),S8(1,7),S8(1,8),S8(1,9),S8(1,10));
[ECEF_Px_s9,ECEF_Py_s9,ECEF_Pz_s9,long_s9,latti_s9]=posicionsatelites(t,et,S9(1,1),S9(1,2),S9(1,3),S9(1,4),S9(1,5),S9(1,6),S9(1,7),S9(1,8),S9(1,9),S9(1,10));
[ECEF_Px_s10,ECEF_Py_s10,ECEF_Pz_s10,long_s10,latti_s10]=posicionsatelites(t,et,S10(1,1),S10(1,2),S10(1,3),S10(1,4),S10(1,5),S10(1,6),S10(1,7),S10(1,8),S10(1,9),S10(1,10));
[ECEF_Px_s11,ECEF_Py_s11,ECEF_Pz_s11,long_s11,latti_s11]=posicionsatelites(t,et,S11(1,1),S11(1,2),S11(1,3),S11(1,4),S11(1,5),S11(1,6),S11(1,7),S11(1,8),S11(1,9),S11(1,10));
[ECEF_Px_s12,ECEF_Py_s12,ECEF_Pz_s12,long_s12,latti_s12]=posicionsatelites(t,et,S12(1,1),S12(1,2),S12(1,3),S12(1,4),S12(1,5),S12(1,6),S12(1,7),S12(1,8),S12(1,9),S12(1,10));
[ECEF_Px_s13,ECEF_Py_s13,ECEF_Pz_s13,long_s13,latti_s13]=posicionsatelites(t,et,S13(1,1),S13(1,2),S13(1,3),S13(1,4),S13(1,5),S13(1,6),S13(1,7),S13(1,8),S13(1,9),S13(1,10));
[ECEF_Px_s14,ECEF_Py_s14,ECEF_Pz_s14,long_s14,latti_s14]=posicionsatelites(t,et,S14(1,1),S14(1,2),S14(1,3),S14(1,4),S14(1,5),S14(1,6),S14(1,7),S14(1,8),S14(1,9),S14(1,10));
[ECEF_Px_s15,ECEF_Py_s15,ECEF_Pz_s15,long_s15,latti_s15]=posicionsatelites(t,et,S15(1,1),S15(1,2),S15(1,3),S15(1,4),S15(1,5),S15(1,6),S15(1,7),S15(1,8),S15(1,9),S15(1,10));
[ECEF_Px_s16,ECEF_Py_s16,ECEF_Pz_s16,long_s16,latti_s16]=posicionsatelites(t,et,S16(1,1),S16(1,2),S16(1,3),S16(1,4),S16(1,5),S16(1,6),S16(1,7),S16(1,8),S16(1,9),S16(1,10));
[ECEF_Px_s17,ECEF_Py_s17,ECEF_Pz_s17,long_s17,latti_s17]=posicionsatelites(t,et,S17(1,1),S17(1,2),S17(1,3),S17(1,4),S17(1,5),S17(1,6),S17(1,7),S17(1,8),S17(1,9),S17(1,10));
[ECEF_Px_s18,ECEF_Py_s18,ECEF_Pz_s18,long_s18,latti_s18]=posicionsatelites(t,et,S18(1,1),S18(1,2),S18(1,3),S18(1,4),S18(1,5),S18(1,6),S18(1,7),S18(1,8),S18(1,9),S18(1,10));
[ECEF_Px_s19,ECEF_Py_s19,ECEF_Pz_s19,long_s19,latti_s19]=posicionsatelites(t,et,S19(1,1),S19(1,2),S19(1,3),S19(1,4),S19(1,5),S19(1,6),S19(1,7),S19(1,8),S19(1,9),S19(1,10));
[ECEF_Px_s20,ECEF_Py_s20,ECEF_Pz_s20,long_s20,latti_s20]=posicionsatelites(t,et,S20(1,1),S20(1,2),S20(1,3),S20(1,4),S20(1,5),S20(1,6),S20(1,7),S20(1,8),S20(1,9),S20(1,10));
[ECEF_Px_s21,ECEF_Py_s21,ECEF_Pz_s21,long_s21,latti_s21]=posicionsatelites(t,et,S21(1,1),S21(1,2),S21(1,3),S21(1,4),S21(1,5),S21(1,6),S21(1,7),S21(1,8),S21(1,9),S21(1,10));
[ECEF_Px_s22,ECEF_Py_s22,ECEF_Pz_s22,long_s22,latti_s22]=posicionsatelites(t,et,S22(1,1),S22(1,2),S22(1,3),S22(1,4),S22(1,5),S22(1,6),S22(1,7),S22(1,8),S22(1,9),S22(1,10));
[ECEF_Px_s23,ECEF_Py_s23,ECEF_Pz_s23,long_s23,latti_s23]=posicionsatelites(t,et,S23(1,1),S23(1,2),S23(1,3),S23(1,4),S23(1,5),S23(1,6),S23(1,7),S23(1,8),S23(1,9),S23(1,10));
[ECEF_Px_s24,ECEF_Py_s24,ECEF_Pz_s24,long_s24,latti_s24]=posicionsatelites(t,et,S24(1,1),S24(1,2),S24(1,3),S24(1,4),S24(1,5),S24(1,6),S24(1,7),S24(1,8),S24(1,9),S24(1,10));

%[ECEF_P_T,LLAT_rad,LLAT_deg]=POS_SAT_V2(t,et,ephemeris);
%%%
%FUNCION QUE GENERA LAS GRAFICAS, NO SIRVE DE CARA AL PROYECTO EN SI, PERO
%ES MAS VISUAL
%%%
%graficas(ECEF_Px_s1,ECEF_Py_s1,ECEF_Pz_s1,ECEF_Px_s2,ECEF_Py_s2,ECEF_Pz_s2,ECEF_Px_s3,ECEF_Py_s3,ECEF_Pz_s3,ECEF_Px_s4,ECEF_Py_s4,ECEF_Pz_s4,ECEF_Px_s5,ECEF_Py_s5,ECEF_Pz_s5,ECEF_Px_s6,ECEF_Py_s6,ECEF_Pz_s6,ECEF_Px_s7,ECEF_Py_s7,ECEF_Pz_s7,ECEF_Px_s8,ECEF_Py_s8,ECEF_Pz_s8,ECEF_Px_s9,ECEF_Py_s9,ECEF_Pz_s9,ECEF_Px_s10,ECEF_Py_s10,ECEF_Pz_s10,ECEF_Px_s11,ECEF_Py_s11,ECEF_Pz_s11,ECEF_Px_s12,ECEF_Py_s12,ECEF_Pz_s12,ECEF_Px_s13,ECEF_Py_s13,ECEF_Pz_s13,ECEF_Px_s14,ECEF_Py_s14,ECEF_Pz_s14,ECEF_Px_s15,ECEF_Py_s15,ECEF_Pz_s15,ECEF_Px_s16,ECEF_Py_s16,ECEF_Pz_s16,ECEF_Px_s17,ECEF_Py_s17,ECEF_Pz_s17,ECEF_Px_s18,ECEF_Py_s18,ECEF_Pz_s18,ECEF_Px_s19,ECEF_Py_s19,ECEF_Pz_s19,ECEF_Px_s20,ECEF_Py_s20,ECEF_Pz_s20,ECEF_Px_s21,ECEF_Py_s21,ECEF_Pz_s21,ECEF_Px_s22,ECEF_Py_s22,ECEF_Pz_s22,ECEF_Px_s23,ECEF_Py_s23,ECEF_Pz_s23,ECEF_Px_s24,ECEF_Py_s24,ECEF_Pz_s24,RE);
%%graficas2(ECEF_P_T,RE)
%%%
%SIGUIENTE PASO: PENSAR EN UNA FORMA INTRODUCIR UN TIEMPO CONCRETO Y QUE EL
%PROGRAMA VAYA A LOS VECTORES Y ELIJA LOS VALORES CORRECTOS DE CADA
%UNA VEZ TENGA ESO EL SIGUIENTE PASO SERA DECIDIR QUE SATELITES ESTAN POR
%ENCIMA DEL PLANO DEL HORIZONTE DE UN PUNTO Y ESTUDIAR SOLO ESOS SATELITES
%%%
%ECEF_P_T_tiempo=squeeze(ECEF_P_T(:,:,tiempo));
%matrizsatelites=ECEF_P_T_tiempo; ESTO es lo verdadero, aunque hay que
%resolver la discrepancia de por que hay una diferencia del 0,05%
%calculando de una forma y de otra
[ PS1 ] = posicionentiempo( tiempo,ECEF_Px_s1,ECEF_Py_s1,ECEF_Pz_s1 );
[ PS2 ] = posicionentiempo( tiempo,ECEF_Px_s2,ECEF_Py_s2,ECEF_Pz_s2);
[ PS3 ] = posicionentiempo( tiempo,ECEF_Px_s3,ECEF_Py_s3,ECEF_Pz_s3 );
[ PS4 ] = posicionentiempo( tiempo,ECEF_Px_s4,ECEF_Py_s4,ECEF_Pz_s4 );
[ PS5 ] = posicionentiempo( tiempo,ECEF_Px_s5,ECEF_Py_s5,ECEF_Pz_s5 );
[ PS6 ] = posicionentiempo( tiempo,ECEF_Px_s6,ECEF_Py_s6,ECEF_Pz_s6 );
[ PS7 ] = posicionentiempo( tiempo,ECEF_Px_s7,ECEF_Py_s7,ECEF_Pz_s7 );
[ PS8 ] = posicionentiempo( tiempo,ECEF_Px_s8,ECEF_Py_s8,ECEF_Pz_s8 );
[ PS9 ] = posicionentiempo( tiempo,ECEF_Px_s9,ECEF_Py_s9,ECEF_Pz_s9 );
[ PS10 ] = posicionentiempo( tiempo,ECEF_Px_s10,ECEF_Py_s10,ECEF_Pz_s10 );
[ PS11 ] = posicionentiempo( tiempo,ECEF_Px_s11,ECEF_Py_s11,ECEF_Pz_s11 );
[ PS12 ] = posicionentiempo( tiempo,ECEF_Px_s12,ECEF_Py_s12,ECEF_Pz_s12 );
[ PS13 ] = posicionentiempo( tiempo,ECEF_Px_s13,ECEF_Py_s13,ECEF_Pz_s13 );
[ PS14 ] = posicionentiempo( tiempo,ECEF_Px_s14,ECEF_Py_s14,ECEF_Pz_s14 );
[ PS15 ] = posicionentiempo( tiempo,ECEF_Px_s15,ECEF_Py_s15,ECEF_Pz_s15 );
[ PS16 ] = posicionentiempo( tiempo,ECEF_Px_s16,ECEF_Py_s16,ECEF_Pz_s16 );
[ PS17 ] = posicionentiempo( tiempo,ECEF_Px_s17,ECEF_Py_s17,ECEF_Pz_s17 );
[ PS18 ] = posicionentiempo( tiempo,ECEF_Px_s18,ECEF_Py_s18,ECEF_Pz_s18 );
[ PS19 ] = posicionentiempo( tiempo,ECEF_Px_s19,ECEF_Py_s19,ECEF_Pz_s19 );
[ PS20 ] = posicionentiempo( tiempo,ECEF_Px_s20,ECEF_Py_s20,ECEF_Pz_s20 );
[ PS21 ] = posicionentiempo( tiempo,ECEF_Px_s11,ECEF_Py_s21,ECEF_Pz_s21 );
[ PS22 ] = posicionentiempo( tiempo,ECEF_Px_s22,ECEF_Py_s22,ECEF_Pz_s22 );
[ PS23 ] = posicionentiempo( tiempo,ECEF_Px_s23,ECEF_Py_s23,ECEF_Pz_s23 );
[ PS24 ] = posicionentiempo( tiempo,ECEF_Px_s24,ECEF_Py_s24,ECEF_Pz_s14 );

matrizsatelites=zeros(24,3); %EN MATRIZ SATELITES TENEMOS LAS POSITIONES EN EL 
%TIEMPO definido DE LOS 24 SATELITES
matrizsatelites(1,1:3)=PS1;
matrizsatelites(2,1:3)=PS2;
matrizsatelites(3,1:3)=PS3;
matrizsatelites(4,1:3)=PS4;
matrizsatelites(5,1:3)=PS5;
matrizsatelites(6,1:3)=PS6;
matrizsatelites(7,1:3)=PS7;
matrizsatelites(8,1:3)=PS8;
matrizsatelites(9,1:3)=PS9;
matrizsatelites(10,1:3)=PS10;
matrizsatelites(11,1:3)=PS11;
matrizsatelites(12,1:3)=PS12;
matrizsatelites(13,1:3)=PS13;
matrizsatelites(14,1:3)=PS14;
matrizsatelites(15,1:3)=PS15;
matrizsatelites(16,1:3)=PS16;
matrizsatelites(17,1:3)=PS17;
matrizsatelites(18,1:3)=PS18;
matrizsatelites(19,1:3)=PS19;
matrizsatelites(20,1:3)=PS20;
matrizsatelites(21,1:3)=PS21;
matrizsatelites(22,1:3)=PS22;
matrizsatelites(23,1:3)=PS23;
matrizsatelites(24,1:3)=PS24;
%graficas2(); AQUI ME GUSTARIA REPRESENTAR LA POSICION CON UN PUNTO DE CADA
%SATELITE
%PS1_lla=ecef2lla(PS1); %calcula usando el aerospace toolbox latitude, longitude and altitude
% clearvars S1 S2 S3 S4 S5 S6 S7 S8 S9 S10 S11 S12 S13 S14 S15 S16 S17 S18 S19 S20 S21 S22 S23 S24
% clearvars ECEF_Px_s1 ECEF_Py_s1 ECEF_Pz_s1 long_s1 latti_s1
% clearvars ECEF_Px_s2 ECEF_Py_s2 ECEF_Pz_s2 long_s2 latti_s2
% clearvars ECEF_Px_s3 ECEF_Py_s3 ECEF_Pz_s3 long_s3 latti_s3
% clearvars ECEF_Px_s4 ECEF_Py_s4 ECEF_Pz_s4 long_s4 latti_s4
% clearvars ECEF_Px_s5 ECEF_Py_s5 ECEF_Pz_s5 long_s5 latti_s5
% clearvars ECEF_Px_s6 ECEF_Py_s6 ECEF_Pz_s6 long_s6 latti_s6
% clearvars ECEF_Px_s7 ECEF_Py_s7 ECEF_Pz_s7 long_s7 latti_s7
% clearvars ECEF_Px_s8 ECEF_Py_s8 ECEF_Pz_s8 long_s8 latti_s8
% clearvars ECEF_Px_s9 ECEF_Py_s9 ECEF_Pz_s9 long_s9 latti_s9
% clearvars ECEF_Px_s10 ECEF_Py_s10 ECEF_Pz_s10 long_s10 latti_s10
% clearvars ECEF_Px_s11 ECEF_Py_s11 ECEF_Pz_s11 long_s11 latti_s11
% clearvars ECEF_Px_s12 ECEF_Py_s12 ECEF_Pz_s12 long_s12 latti_s12
% clearvars ECEF_Px_s13 ECEF_Py_s13 ECEF_Pz_s13 long_s13 latti_s13
% clearvars ECEF_Px_s14 ECEF_Py_s14 ECEF_Pz_s14 long_s14 latti_s14
% clearvars ECEF_Px_s15 ECEF_Py_s15 ECEF_Pz_s15 long_s15 latti_s15
% clearvars ECEF_Px_s16 ECEF_Py_s16 ECEF_Pz_s16 long_s16 latti_s16
% clearvars ECEF_Px_s17 ECEF_Py_s17 ECEF_Pz_s17 long_s17 latti_s17
% clearvars ECEF_Px_s18 ECEF_Py_s18 ECEF_Pz_s18 long_s18 latti_s18
% clearvars ECEF_Px_s19 ECEF_Py_s19 ECEF_Pz_s19 long_s19 latti_s19
% clearvars ECEF_Px_s20 ECEF_Py_s20 ECEF_Pz_s20 long_s20 latti_s20
% clearvars ECEF_Px_s21 ECEF_Py_s21 ECEF_Pz_s21 long_s21 latti_s21
% clearvars ECEF_Px_s22 ECEF_Py_s22 ECEF_Pz_s22 long_s22 latti_s22
% clearvars ECEF_Px_s23 ECEF_Py_s23 ECEF_Pz_s23 long_s23 latti_s23
% clearvars ECEF_Px_s24 ECEF_Py_s24 ECEF_Pz_s24 long_s24 latti_s24

%%NUEVA GEOMETRÍA DE SATELITES
 %[ geometria,tan2,dis_sat_flat2 ] = geometry2(c_efef_urgel ,ECEF_P_T_tiempo );

%%ANTIGUO METODO POCO EFICIENTE


[ distance_satellite_flat_S1,tan_s1 ] = geometry( PS1(1),PS1(2),PS1(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S2,tan_s2 ] = geometry( PS2(1),PS2(2),PS2(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S3,tan_s3 ] = geometry( PS3(1),PS3(2),PS3(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S4,tan_s4 ] = geometry( PS4(1),PS4(2),PS4(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S5,tan_s5 ] = geometry( PS5(1),PS5(2),PS5(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S6,tan_s6 ] = geometry( PS6(1),PS6(2),PS6(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S7,tan_s7 ] = geometry( PS7(1),PS7(2),PS7(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S8,tan_s8 ] = geometry( PS8(1),PS8(2),PS8(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S9,tan_s9 ] = geometry( PS9(1),PS9(2),PS9(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S10,tan_s10 ] = geometry( PS10(1),PS10(2),PS10(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S11,tan_s11 ] = geometry( PS11(1),PS11(2),PS11(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S12,tan_s12 ] = geometry( PS12(1),PS12(2),PS12(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S13,tan_s13 ] = geometry( PS13(1),PS13(2),PS13(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S14,tan_s14 ] = geometry( PS14(1),PS14(2),PS14(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S15,tan_s15 ] = geometry( PS15(1),PS15(2),PS15(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S16,tan_s16 ] = geometry( PS16(1),PS16(2),PS16(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S17,tan_s17 ] = geometry( PS17(1),PS17(2),PS17(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S18,tan_s18 ] = geometry( PS18(1),PS18(2),PS18(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S19,tan_s19 ] = geometry( PS19(1),PS19(2),PS19(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S20,tan_s20 ] = geometry( PS20(1),PS20(2),PS20(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S21,tan_s21 ] = geometry( PS21(1),PS21(2),PS21(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S22,tan_s22 ] = geometry( PS22(1),PS22(2),PS22(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S23,tan_s23 ] = geometry( PS23(1),PS23(2),PS23(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );
[ distance_satellite_flat_S24,tan_s24 ] = geometry( PS24(1),PS24(2),PS24(3),c_efef_urgel(1),c_efef_urgel(2),c_efef_urgel(3),RE );

matriz_distances_satellites=zeros(24,1);
matriz_angles_satellites=zeros(24,1);

matriz_distancias_satellites(1)=distance_satellite_flat_S1;
matriz_distancias_satellites(2)=distance_satellite_flat_S2;
matriz_distancias_satellites(3)=distance_satellite_flat_S3;
matriz_distancias_satellites(4)=distance_satellite_flat_S4;
matriz_distancias_satellites(5)=distance_satellite_flat_S5;
matriz_distancias_satellites(6)=distance_satellite_flat_S6;
matriz_distancias_satellites(7)=distance_satellite_flat_S7;
matriz_distancias_satellites(8)=distance_satellite_flat_S8;
matriz_distancias_satellites(9)=distance_satellite_flat_S9;
matriz_distancias_satellites(10)=distance_satellite_flat_S10;
matriz_distancias_satellites(11)=distance_satellite_flat_S11;
matriz_distancias_satellites(12)=distance_satellite_flat_S12;
matriz_distancias_satellites(13)=distance_satellite_flat_S13;
matriz_distancias_satellites(14)=distance_satellite_flat_S14;
matriz_distancias_satellites(15)=distance_satellite_flat_S15;
matriz_distancias_satellites(16)=distance_satellite_flat_S16;
matriz_distancias_satellites(17)=distance_satellite_flat_S17;
matriz_distancias_satellites(18)=distance_satellite_flat_S18;
matriz_distancias_satellites(19)=distance_satellite_flat_S19;
matriz_distancias_satellites(20)=distance_satellite_flat_S20;
matriz_distancias_satellites(21)=distance_satellite_flat_S21;
matriz_distancias_satellites(22)=distance_satellite_flat_S22;
matriz_distancias_satellites(23)=distance_satellite_flat_S23;
matriz_distancias_satellites(24)=distance_satellite_flat_S24;

matriz_angles_satellites(1)=tan_s1;
matriz_angles_satellites(2)=tan_s2;
matriz_angles_satellites(3)=tan_s3;
matriz_angles_satellites(4)=tan_s4;
matriz_angles_satellites(5)=tan_s5;
matriz_angles_satellites(6)=tan_s6;
matriz_angles_satellites(7)=tan_s7;
matriz_angles_satellites(8)=tan_s8;
matriz_angles_satellites(9)=tan_s9;
matriz_angles_satellites(10)=tan_s10;
matriz_angles_satellites(11)=tan_s11;
matriz_angles_satellites(12)=tan_s12;
matriz_angles_satellites(13)=tan_s13;
matriz_angles_satellites(14)=tan_s14;
matriz_angles_satellites(15)=tan_s15;
matriz_angles_satellites(16)=tan_s16;
matriz_angles_satellites(17)=tan_s17;
matriz_angles_satellites(18)=tan_s18;
matriz_angles_satellites(19)=tan_s19;
matriz_angles_satellites(20)=tan_s20;
matriz_angles_satellites(21)=tan_s21;
matriz_angles_satellites(22)=tan_s22;
matriz_angles_satellites(23)=tan_s23;
matriz_angles_satellites(24)=tan_s24;

% satelites_visibles=matriz_angles_satellites>0; %matriz logica con 1 en los satelites visibles
% indice_satelites_visibles=find(satelites_visibles) %devuelve los indices de los satelites visibles
% numero_de_satelites_visibles=size(indice_satelites_visibles)%numero de satelites
% matriz_satelites_sobreplano=matrizsatelites(indice_satelites_visibles,:)%en esta matriz meto los satelites sobre el plano en el momento de tiempo pedido
toc;
close(h);