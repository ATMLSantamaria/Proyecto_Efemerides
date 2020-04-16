%this function compute the point of intersection of a line that is
%perpendicular to the flat area that contains the plane and it is
%tangent to the earth
%,angle_satellite_plane,direction_satellite_flat
function [ distance_satellite_flat,tan ] = geometry( satellite_x,satellite_y,satellite_z,plane_x,plane_y,plane_z,RE );
b=(plane_x*satellite_x+plane_y*satellite_y+plane_z*satellite_z)/(plane_x*plane_x+plane_y*plane_y+plane_z*plane_z);

tan=sqrt((plane_x^2+plane_y^2+plane_z^2)*(1-b)/((satellite_x-plane_x*b)+(satellite_y-plane_y*b)+(satellite_z-plane_z*b)));
d=sqrt(plane_x*plane_x+plane_y*plane_y+plane_z*plane_z);
distance_satellite_flat=(plane_x*satellite_x+plane_y*satellite_y+plane_z*satellite_z+d*d)/(d);
%angle_satellite_plane=0
%direction_satellite_flat=0
end

