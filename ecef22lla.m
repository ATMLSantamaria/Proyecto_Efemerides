function [lon_lat] = ecef22lla(ECEF,a,e,t,et)
%et=24*60*60;%(s)
%t=0:600:et;
% WGS84 ellipsoid constants:
%  a = 6378137;
% e = 8.1819190842622e-2;
%x=1200e7;
%y=8000e7;
%z=500;
% calculations:
for j=1:length(t)
x=ECEF(1,j);
y=ECEF(2,j);
z=ECEF(3,j);
b   = sqrt(a^2*(1-e^2));
ep  = sqrt((a^2-b^2)/b^2);
p   = sqrt(x.^2+y.^2);
th  = atan2(a*z,b*p);
lon = atan2(y,x);
lat = atan2((z+ep^2.*b.*sin(th).^3),(p-e^2.*a.*cos(th).^3));
N   = a./sqrt(1-e^2.*sin(lat).^2);
alt = p./cos(lat)-N;

% return lon in range [0,2*pi)
%lon = mod(lon,2*pi);

lon_lat(1,j)=lon;
lon_lat(2,j)=lat;
% correct for numerical instability in altitude near exact poles:
% (after this correction, error is about 2 millimeters, which is about
% the same as the numerical precision of the overall function)

% k=abs(x)<1 & abs(y)<1;
% alt(k) = abs(z(k))-b;
%lon_lat(3,j)=alt(k);
%plot(lon,lat,'.')
%hold on
end
%return
