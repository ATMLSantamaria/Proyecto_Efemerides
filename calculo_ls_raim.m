function [r,SSE] = calculo_ls_raim(rho_est,rho_medido,G,ecef_usuario)
    x_us_est=ecef_usuario(1); %%  estimacion de x de us
    y_us_est=ecef_usuario(2); %%  estimacion de y de us
    z_us_est=ecef_usuario(3); %%  estimacion de z de us    
    numsat=size(rho_est,2);
    %% Calculo de posicion por mínimos cuadrados
    dif_rho=(rho_est-rho_medido)';
    dif_r_ls_previo=pinv(G'*G)*G';
    %% delta x por minimos cuadrados
    dif_r_ls=dif_r_ls_previo*dif_rho;
    
    %% Posicion del usuario a partir de la x estimada y el deltax por minimos cuadrados
    r_usuario(1)=x_us_est-dif_r_ls(1);
    r_usuario(2)=y_us_est-dif_r_ls(2);
    r_usuario(3)=z_us_est-dif_r_ls(3);
    %% Estimacion de rho en funcion de dis_rho que se usa para el calculo de errores
    y_rho_est_ls=G*pinv(G'*G)*G'*dif_rho;
    PPP=G*pinv(G'*G)*G';
    %% Error epsilon
    error_est=dif_rho-y_rho_est_ls;
    
    %% Suma de errores cuadrados
    SSE=error_est'*error_est;
    
    % Estadistico de COMPROBACIÓN
    numsat;
    r=sqrt(SSE/(numsat-4));
end

