%function [Gdop,gdop] = calculo_gdop_para_t_determinado(posicion_satelites_ecef,ecef_usuario,t,RE)
%  X_sat=squeeze(posicion_satelites_ecef(:,1,:));
%  Y_sat=squeeze(posicion_satelites_ecef(:,2,:));
%  Z_sat=squeeze(posicion_satelites_ecef(:,3,:));
% X_sat_t=squeeze(X_sat(:,t))
format longEng 
x_sat_vis=ecef_sat_vis_con_angulo(:,1);
y_sat_vis=ecef_sat_vis_con_angulo(:,2);
z_sat_vis=ecef_sat_vis_con_angulo(:,3);
x_us_est=ecef_usuario(1); %%  estimacion de x de us
y_us_est=ecef_usuario(2); %%  estimacion de y de us
z_us_est=ecef_usuario(3); %%  estimacion de z de us
% Declare constants
SigLevel = 1.7*10^-5;
numsat=size(ecef_sat_vis_con_angulo,1);
num_sat=1:1:numsat;
q=1;
dif_res=zeros(length(num_sat),4);
for sat=1:length(num_sat)
    
   xsat= x_sat_vis(sat);
   ysat= y_sat_vis(sat);
   zsat= z_sat_vis(sat);
   
   rho_modulo_est=sqrt(((xsat-x_us_est)^2)+((ysat-y_us_est)^2)+((zsat-z_us_est)^2)); %Pseudo-range from ground-station to satellite
    
   r=sqrt(((xsat-0)^2)+((ysat-0)^2)+((zsat-0)^2)); %distance between earth-centre to satellite
   a=(x_us_est-xsat)/rho_modulo_est;
   b=(y_us_est-ysat)/rho_modulo_est;
   c=(z_us_est-zsat)/rho_modulo_est;


   I=horzcat(a,b,c);
   II(sat,:)=[I,1]; %% esto es lo que se llama G en el paper
   
   N=1;
   HH=horzcat(a,b,c,N);
   %Removal of rows having zero at 4th column 
   G(q,:)=HH;   %G matrix for visible satellites
   q=q+1;
   
   rho_est(sat)=rho_modulo_est; %  distancia usuario satelite

%    if(sat==6)
%        rho(sat)=rho(sat);
%    end
   %% rho medido es hipotetico, ya que no dispongo de un rho medido real
   %%sin embargo de cara a la implementacion del algoritmo no importa,
   %%si en el futuro alguien continua este desarrollo simplemente debe
   %%calcular el pseudorango medido en base al desase temporal entre
   %%reloj de usuario y satelite, velocidad de la luz, y si se quiere 
   %%afinar mas, errores ionosféricos, troposféricos y demás
   rho_medido(sat)=rho_modulo_est+rho_modulo_est*0.00001; %  rho medido error de orden de metros en un rho de 20200000 metros
   if(sat==6)
        rho_medido(sat)=rho_modulo_est+rho_modulo_est*0.00001;
   end
   
end
% parte referida a factores dop
vis_sat=sum(G(:,4)==1);
HHH=G; %% esta matriz deberia ser num_sat x 4
TT=HHH'*HHH; %% esta es la matriz de la covarianza
DD=pinv(TT);
TrTr=(trace(DD));
gdop_t=sqrt(TrTr); 
pdop_t=sqrt(DD(1,1)+DD(2,2)+DD(3,3));
hdop_t=sqrt(DD(1,1)+DD(2,2));
vdop_t=sqrt(DD(3,3));

%  parte referida a lo que sea %%HHH es G
dif_rho=(rho_est-rho_medido)';
dif_r_ls_previo=pinv(HHH'*HHH)*HHH'; % en el codigo es ^x
%x de minimos cuadrados estimada
dif_r_ls=dif_r_ls_previo*dif_rho;
%dif_r_ls = r_est-r_user
format longEng 
r_usuario(1)=x_us_est-dif_r_ls(1);
r_usuario(2)=y_us_est-dif_r_ls(2);
r_usuario(3)=z_us_est-dif_r_ls(3);
%  r_usuario representa la posición calculada del usuario por mínimos
%  cuadrados

%Ahora calcular el estimado de rho en funciond de r_ls
y_rho_est_ls=HHH*pinv(HHH'*HHH)*HHH'*dif_rho;
PPP=HHH*pinv(HHH'*HHH)*HHH';
% error epslon con sombrero
error_est=dif_rho-y_rho_est_ls
% suma de errores cuadrados
SSE=error_est'*error_est; %% sum of square errors

%estadistico de prueba
rr=sqrt(SSE/(length(num_sat)-4));
rd=8;
ri=10;
%% si r es menor que el umbral inferior todos los satelites funcionan,
%% si es superior al umbral superior, se ha detectado un fallo
matriz_con_r=[];
for i=1:length(num_sat)
    i;
    a=ecef_sat_vis_con_angulo;
    a(i,:)=[];
    [matriz_con_r(i),matriz_SSE(i)]=calculo_de_ecuacion_matricial(a,ecef_usuario,false,1);
end
[rre,SSSSEE]=calculo_de_ecuacion_matricial(ecef_sat_vis_con_angulo,ecef_usuario,false,1);
matriz_con_r';
 %r se testa contra el Threshold que nos da la tabla del articulo
% si r > threshold ->fallo
% r< threshold -no fallo