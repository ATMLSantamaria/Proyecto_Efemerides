function [G,rho_est,rho_medido] = calculo_de_ecuacion_matricial(ecef_sat_vis_con_angulo,ecef_usuario,con_error_en_satelite_n,n)
    x_sat_vis=ecef_sat_vis_con_angulo(:,1);
    y_sat_vis=ecef_sat_vis_con_angulo(:,2); 
    z_sat_vis=ecef_sat_vis_con_angulo(:,3);
    x_us_est=ecef_usuario(1); %%  estimacion de x de us
    y_us_est=ecef_usuario(2); %%  estimacion de y de us
    z_us_est=ecef_usuario(3); %%  estimacion de z de us
    numsat=size(ecef_sat_vis_con_angulo,1);
    for sat=1:numsat
        xsat= x_sat_vis(sat);
        ysat= y_sat_vis(sat);
        zsat= z_sat_vis(sat);
        
        rho_modulo_est=sqrt(((xsat-x_us_est)^2)+((ysat-y_us_est)^2)+((zsat-z_us_est)^2)); %Pseudo-range from ground-station to satellite
        
        %% COMPONENTES DE I
        a=(x_us_est-xsat)/rho_modulo_est;
        b=(y_us_est-ysat)/rho_modulo_est;
        c=(z_us_est-zsat)/rho_modulo_est;
        
        N=1;
        I=horzcat(a,b,c,N);
        G(sat,:)=I;
        
        %% Matriz con rangos a la posicion estimada
        rho_est(sat)=rho_modulo_est;
        rho_medido(sat)=rho_modulo_est+rho_modulo_est*0.00001;
        if (con_error_en_satelite_n==true)
            if(sat==n)
                rho_medido(sat)=rho_modulo_est+rho_modulo_est*0.00001+rho_modulo_est*0.000015;
            end
        end     
    end
end

