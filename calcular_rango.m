function [rango_geometrico,ecef_rango]=calcular_rango(ecef_sat_vis_con_angulo,ecef_usuario);

ecef_rango = ecef_sat_vis_con_angulo - ecef_usuario;
num_sat = size(ecef_sat_vis_con_angulo,1);
num_dim = size(ecef_sat_vis_con_angulo,2);
rango_geometrico = zeros(num_sat,1);
for i = 1 : num_sat
    rango = 0;
    for j = 1 : num_dim
        rango = rango+(ecef_rango(i,j))^2;
    end
    rango_geometrico(i,1) = sqrt(rango); 
end

end