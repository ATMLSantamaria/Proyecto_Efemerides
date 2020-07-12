function [ecef_sat_vis_con_dis,ecef_sat_vis_con_angulo]=crear_matriz_ecef_sat_vis(posicion_satelites_ecef_t,dis_sat_flat_1t,alfa_rad_1t,rad2deg,angulo_mascara)
%% Aqui calculo una matriz con las posiciones x,y,z exclusivamente de los
%% satelites visibles EN UN MOMENTO EN EL TIEMPO usando la distancia
%% satelite-planotangente. y usando el angulo

dis_sat_flat_1t=dis_sat_flat_1t';
vis_con_dis=dis_sat_flat_1t>0;
pos=find(vis_con_dis);
ecef_sat_vis_con_dis=posicion_satelites_ecef_t(pos,:);

%% Aqui calculo una matriz con las posiciones x,y,z exclusivamente de los
%% satelites visibles EN UN MOMENTO EN EL TIEMPO usando el ángulo.Uso un angulo de mascara de 5


alfa_rad_1t=alfa_rad_1t';
vis_con_ang=alfa_rad_1t*rad2deg>angulo_mascara;
pos2=find(vis_con_ang);
ecef_sat_vis_con_angulo=posicion_satelites_ecef_t(pos2,:);



end
