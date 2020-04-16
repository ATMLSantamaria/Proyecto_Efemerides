%in this function i want to read altitud and coordinates of each point
%and give back in ECEF coordinates
%No he conseguido descargar el excel con los puntos asi que de momento
%usare un excel de prueba
function [altitudematrix]=readaltitude (filename)

altitudematrix=xlsread(filename)
%esto me genera una matriz con coordenada x, y y altitud
%necesito saber mas teoria sobre la altitud para cambiar de coordenadas
end

