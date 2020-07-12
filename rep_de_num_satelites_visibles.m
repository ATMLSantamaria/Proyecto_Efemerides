function [visibilidades_dis,visibilidades_ang]=rep_de_num_satelites_visibles(dis_sat_flat_para_todo_t,alfa_rad_para_todo_t,rad2deg,angulo_mascara)
%%
%%Aqui calculo la cantidad de veces que se repite una visibilidad
%%determinada usando distancia satelite-planotangente
indice_satelites_visibles_total_con_dis=dis_sat_flat_para_todo_t>0;
numero_satelites_visibles_total=sum(indice_satelites_visibles_total_con_dis,1);
for i=1:24
b=size(find(numero_satelites_visibles_total==i));
visibilidades_dis(i,1)=b(2);
end
clear i
%%Aqui calculo la cantidad de veces que se repite una visibilidad
%%determinada usando angulo
indice_satelites_visibles_total_con_ang=alfa_rad_para_todo_t*rad2deg>angulo_mascara;
numero_satelites_visibles_total2=sum(indice_satelites_visibles_total_con_ang,1);
for i=1:24
b=size(find(numero_satelites_visibles_total2==i));
visibilidades_ang(i,1)=b(2);
end
clear b
end

