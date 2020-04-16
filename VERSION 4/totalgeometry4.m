%Función que hace lo mismo que geometry4 pero en lugar de para un sólo
%instante de tiempo para todos los instantes del vector que estemos
%contemplando. Es decir, añade una dimensión a la matriz dis_sat_flat,
%haciendo que contenga las distancias para cada instante de tiempo a lo
%largo de la semana.
function [ geometriatotal,alfa_rad_total1,dis_sat_flat_total1 ] = totalgeometry4( c,a,t )
% 

format long
% c =1.0e+06 * [4.746870402664512   0.082856931084343   4.246139140586202];
% 
lt=length(t);

alfa_rad_total1=zeros(1,24,lt);
arriba1=zeros(1,24,lt);
abajo1=zeros(1,24,lt);
dis_sat_flat_total1=zeros(1,24,lt);

%%Aquí lo hago operando con bucle 
for longitud=1:lt
    
    for satt=1:24
        d1=norm(c);
        arriba1(1,satt,longitud)=c(1)*a(satt,1,longitud)+c(2)*a(satt,2,longitud)+c(3)*a(satt,3,longitud)-d1^2;
        abajo1 (1,satt,longitud)=(d1*sqrt((a(satt,1,longitud)-c(1))^2+(a(satt,2,longitud)-c(2))^2+(a(satt,3,longitud)-c(3))^2));

        alfa_rad_total1(1,satt,longitud)=asin(arriba1(1,satt,longitud)/abajo1(1,satt,longitud));

        d1=norm(c);
        dis_sat_flat_total1(1,satt,longitud)=(c(1)*a(satt,1,longitud)+c(2)*a(satt,2,longitud)+c(3)*a(satt,3,longitud)-d1*d1)/(d1);
    end
end
dis_sat_flat_total1=squeeze(dis_sat_flat_total1);
alfa_rad_total1=squeeze(alfa_rad_total1);
%%Aqui debajo lo hago operando con matrices %Ahora está bien hecho

% 
% arriba2=c*a'-norm(c)^2;
% resta=a-c;
% resta_resta=resta.*resta;
% resta_resta=sum(resta_resta,2);
% abajo2=norm(c)*sqrt(resta_resta)';
% 
% alfa_rad2=asin(arriba2./abajo2);
%alfa_deg2=alfa_rad2*180/pi;


% d2=norm(c);
% dis_sat_flat2=(c*a'-d2*d2)/d2;




%COMPROBACIONES entre ambos metodos debajo


% mostrararriba=[arriba1;arriba2]';
% mostrarabajo=[abajo1;abajo2]';
% mostraralfa_rad=[alfa_rad1;alfa_rad2]';
% mostrardis_sat_flat=[dis_sat_flat1;dis_sat_flat2]';

%angle_satellite_plane=0
%direction_satellite_flat=0
%end
geometriatotal=[alfa_rad_total1;dis_sat_flat_total1];
end
