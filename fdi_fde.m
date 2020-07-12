function [r_matriz_subconjuntos,satelite_en_fallo,solucion_sat_sin_fallo] = fdi_fde(umbral_error,G_con_error,rho_est_con_error,rho_medido_con_error,ecef_usuario,ecef_sat_vis_con_angulo)
num_sat = size(G_con_error,1);
for i=1:num_sat
    i;
    G_reducida = G_con_error;
    G_reducida(i,:)=[];
    
    rho_est_reducido = rho_est_con_error;
    rho_est_reducido(i) = [];
    
    rho_medido_reducido = rho_medido_con_error;
    rho_medido_reducido(i) = [];
    
    [r_subconjunto,SSE_subconjunto] = calculo_ls_raim(rho_est_reducido,rho_medido_reducido,G_reducida,ecef_usuario);
    r_matriz_subconjuntos(i)=r_subconjunto;

end
indice_satelite_fallo=r_matriz_subconjuntos<umbral_error;
limit=length(indice_satelite_fallo)
satelite_en_fallo=0;
for j=1:limit
    j;
    indice_satelite_fallo(j);
    if indice_satelite_fallo(j)==1
       satelite_en_fallo=j; 
    end
end
solucion_sat_sin_fallo=ecef_sat_vis_con_angulo;
solucion_sat_sin_fallo(satelite_en_fallo,:)=[];

end

