function [ c_ecef ] = ecef_ruta( coordenadas_aeropuerto_o_punto_ruta )

c_ecef=lla2ecef(coordenadas_aeropuerto_o_punto_ruta);
cpx=c_ecef(1);
cpy=c_ecef(2);
cpz=c_ecef(3);


end

