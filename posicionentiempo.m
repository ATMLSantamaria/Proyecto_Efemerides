function [ matrizposicion ] = posicionentiempo( tiempo,coordenada_x,coordenada_y,coordenada_z )
format long
cx=coordenada_x(tiempo);
cy=coordenada_y(tiempo);
cz=coordenada_z(tiempo);
matrizposicion=[cx,cy,cx];



end

