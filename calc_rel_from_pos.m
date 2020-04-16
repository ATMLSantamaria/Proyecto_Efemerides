function [R,AZ,EL,G]=calc_rel_from_pos(satP,P0,azDev)
% Calculate range, azimuth and elevation of satellite at time of signal
% transmission.

noSV = size(satP,2);
nt = size(satP,3);
R = zeros(noSV,nt);
AZ = zeros(noSV,nt);
EL = zeros(noSV,nt);
G = zeros(noSV,4,nt); % zeros(noSV,3,nt);
for i = 1:noSV
    for j = 1:nt
        if satP(1,i,j) ~= 0
            R(i,j) = norm(satP(:,i,j)-P0(:,j));
            [AZ(i,j),EL(i,j)] = toNED(P0(:,j),satP(:,i,j)-P0(:,j));
            AZ(i,j) = AZ(i,j) - azDev;
            % Transform azimuth zero reference.
            if AZ(i,j) < 0
                AZ(i,j) = AZ(i,j) + 360;
            end
%             G(i,:,j) = [-(satP(:,i,j) - P0(:,j)) / R(i,j); 1]; % ECEF
            G(i,:,j) = [-cosd(EL(i,j)) * cosd(AZ(i,j)); ...
                -cosd(EL(i,j)) * sind(AZ(i,j)); ...
                -sind(EL(i,j)); 1];
        end
    end
end

end
