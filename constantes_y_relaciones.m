function [et,rad2deg,deg2rad,RE] = constantes_y_relaciones()
%CONSTANTES Y RELACIONES NECESARIAS A LO LARGO DEL SCRIPT
%  Esta funcion se usa para encapsular el la definicion de estas
%  constantes, así como el cálculo de relaciones necesarias 
%  y dejar más limpio el código principal

format long

et = 24*60*60;%(s) segundos en una semana

rad2deg = 180/pi;
deg2rad = pi/180;

RE=6378000; %Radio de la Tierra

end

