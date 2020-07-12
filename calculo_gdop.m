function [Gdop,gdop]=calculo_gdop(posicion_satelites_ecef,ecef_usuario,t,RE)
X_sat=squeeze(posicion_satelites_ecef(:,1,:));
Y_sat=squeeze(posicion_satelites_ecef(:,2,:));
Z_sat=squeeze(posicion_satelites_ecef(:,3,:));
x=ecef_usuario(1);
y=ecef_usuario(2);
z=ecef_usuario(3);
%GDOP_matriz=zeros(t);
num_sat=1:1:24;

RE = 6378000;                       % Earth's radius                        [m]
muE = 3.986004418e+14;

for p=1:1:144 
    
q=1;

for m=1:length(num_sat)
   
    xsat=X_sat(m,p);
    ysat=Y_sat(m,p);
    zsat=Z_sat(m,p);
     
    d=sqrt(((xsat-x)^2)+((ysat-y)^2)+((zsat-z)^2)); %Pseudo-range from ground-station to satellite
    
    r=sqrt(((xsat-0)^2)+((ysat-0)^2)+((zsat-0)^2)); %distance between earth-centre to satellite
    
    a=(x-xsat)/d;
 
    b=(y-ysat)/d;
 
    c=(z-zsat)/d;
     
    alph=acos((RE^2+d^2-r^2)/(2*RE*d)); % Mask-angle using cosine-triangle concept
    
    alph_deg=radtodeg(alph); % Mask-angle in degrees
    
   
    if alph_deg>=110 && alph_deg<=250 % Considering elevation angle of 20 degrees from both sides
         N=1;
     else
         N=0;
    end
  
    HH=horzcat(a,b,c,N);
    
         if HH(1,4)==1   %Removal of rows having zero at 4th column 
            G(q,:)=HH;   %G matrix for visible satellites
            q=q+1;
         end
         m
end
vis_sat(1,p)=sum(G(:,4)==1);
H=G';
TT=H'*H;
T=G*G'; %La matriz G del cogido es la traspuesta de la matriz H de la teoria, por eso está al reves
D=pinv(T);
Tr=(trace(D));
gdop=sqrt(Tr);          %GDOP for visible satellites
Gdop(1,p)=gdop;         %GDOP matrix for 24hrs with 10 mins time step
end
GDOP_matriz=Gdop;
GDOP_tiempo=gdop;

end
