%Esta funcion calcula un plano tangente a la tierra idealizada como esfera
%perfecta y que pasa por el punto en el que está situado el avión.
%Despúes calcula la distancia perpendicular entre los satélites y dicho
%plano, si da negativa no son visibles. Si da positiva es posible que sí,
%depende de más factores, el ángulo de máscara, las montañas...
%También calcula el ángulo entre la recta que une punto y satélite y dicho
%plano.
%Dato importante es que esta función sólo lo calcula para un momento de
%tiempo dado.

function [ geometria,alfa_rad2,dis_sat_flat2 ] = geometria_para_t_concreto( c,a )
% 
format long
% c =1.0e+06 * [4.746870402664512   0.082856931084343   4.246139140586202];
% 
% a =1.0e+07 *[ 
% 
%   -1.902969692817615  -0.387900031545875  -1.812584725553181
%    1.747415370856773   1.980768904247293  -0.055842038511022
%   -1.698143145685067   0.625148978714928  -1.948022510258464
%    0.934840942748028   1.541370813454996   1.947406565869390
%    0.699433423219154   2.225593227938892  -1.268400444003384
%   -1.027063890736811   1.167216491709199   2.178153896247480
%   -2.485385615032955  -0.196769229337599   0.898124039895172
%   -2.096644806056650   1.174294863644193   1.126461652400356
%    0.683408783794567  -2.546907156232334  -0.376943089181258
%   -2.442394818102993  -0.284865563888902  -1.080255047166956
%    1.634172680198153  -0.229072898941985  -2.104626123462654
%    1.932908197068477   0.973709048385944   1.528635665629066
%   -0.579637560043614  -1.439969149779140  -2.124144365083411
%    2.508126259410165  -0.007389674231297   0.791320976679262
%   -0.691073925790724  -1.608391087978597   1.995603727765754
%   -0.469740663236716   1.474227806553799  -2.122267950435046
%   -2.115810443685425  -1.122619184605973  -1.175075168684693
%    0.348773906995826   1.466919235080260  -2.216825123485473
%    1.490397026336046  -1.745686928386397   1.331736040088841
%    0.708521196853034  -1.527698207086390   2.134683605573377
%   -1.554801356428731  -0.341335138579439  -2.101773319420264
%   -2.603282683472908   0.362070436637342  -0.124382737444497
%    2.062123888730664   0.644670015375876  -1.537788282207776
%    1.615029396377488  -1.662319347257988  -1.336573514589448];


alfa_rad1=zeros(1,24);
arriba1=zeros(1,24);
abajo1=zeros(1,24);
dis_sat_flat1=zeros(1,24);

%%Aquí lo hago operando con bucle 
for satt=1:24
    d1=norm(c);
    arriba1(satt)=c(1)*a(satt,1)+c(2)*a(satt,2)+c(3)*a(satt,3)-d1^2;
    abajo1(satt)=(d1*sqrt((a(satt,1)-c(1))^2+(a(satt,2)-c(2))^2+(a(satt,3)-c(3))^2));
    
    alfa_rad1(satt)=asin(arriba1(satt)/abajo1(satt));
    
    d1=norm(c);
    dis_sat_flat1(satt)=(c(1)*a(satt,1)+c(2)*a(satt,2)+c(3)*a(satt,3)-d1*d1)/(d1);
   
end

%%Aqui debajo lo hago operando con matrices 


arriba2=c*a'-norm(c)^2;
resta=a-c;
resta_resta=resta.*resta;
resta_resta=sum(resta_resta,2);
abajo2=norm(c)*sqrt(resta_resta)';

alfa_rad2=asin(arriba2./abajo2);
%alfa_deg2=alfa_rad2*180/pi;


d2=norm(c);
dis_sat_flat2=(c*a'-d2*d2)/d2;


geometria=[alfa_rad2;dis_sat_flat2]';
end