function [ gfPos,thrPos,dh1HorPos,gfH,dh1H,thrH,dh1Lat,thrLat,dh1Lon,thrLon] = calculateposition(s,feet2m,glidePathAngle)

%This function read from the open xml file parameters about position of
%GF,threshold and FPAP

%location of mms client to edit configuration file
%P:\Development\23010 SESAR_15.3.6_GBAS CAT III\Tools\MDT\2017-10-05_1-17-40-0\Unpackaged_1

%Here I make a matrix that contains the position values (latitude, longitude and height) of the 4 antenas of the
%ground station
latav=0;
lonav=0;
heightav=0;

for antena=1:4

latitude=s.NORMARC_8100.File.Records.Container.Container{1, 2}.Message{1, 1}.Array.Structure{1, antena}.Data{1, 1}.Attributes.Value;
longitude=s.NORMARC_8100.File.Records.Container.Container{1, 2}.Message{1, 1}.Array.Structure{1, antena}.Data{1, 2}.Attributes.Value;
height=s.NORMARC_8100.File.Records.Container.Container{1, 2}.Message{1, 1}.Array.Structure{1, antena}.Data{1, 3}.Attributes.Value;



    
latitude(end)=[];
latdeg=str2num(latitude(1:2));
latmin=str2num(latitude(4:5));
latsec=str2num(latitude(7:8));
latsexa=[latdeg latmin latsec];
latdec=dms2deg(latsexa);


longitude(end)=[];
londeg=str2num(longitude(1:2));
lonmin=str2num(longitude(4:5));
lonsec=str2num(longitude(7:8));
lonsexa=[londeg lonmin lonsec];
londec=dms2deg(lonsexa);

height=str2num(height);

%The part down plus dec results of position of the 4 antenas, in order to
%make average
latav=latav+latdec;
lonav=lonav+londec;
heightav=heightav+height;

end 

gfLat=latav/4;
gfLon=lonav/4;
gfH=heightav/4;

gfPos=zeros(3,1);
[gfPos(1),gfPos(2),gfPos(3)]=geodToECEF(gfLat,gfLon,gfH);

%Now I have to read Threshold from the xml file, there is one Threshold in
%each FAS block so at step first I will take from the Data block 1

thrlat=s.NORMARC_8100.File.Records.Container.Container{1, 2}.Container.Array.Message{1, 1}.Structure.Data{1, 4}.Attributes.Value  
thrlon=s.NORMARC_8100.File.Records.Container.Container{1, 2}.Container.Array.Message{1, 1}.Structure.Data{1, 5}.Attributes.Value  
thrheight=s.NORMARC_8100.File.Records.Container.Container{1, 2}.Container.Array.Message{1, 1}.Structure.Data{1, 6}.Attributes.Value  

%Converse into dec
thrlat(end)=[];
thrlatdeg=str2num(thrlat(1:2));
thrlatmin=str2num(thrlat(4:5));
thrlatsec=str2num(thrlat(7:8));
thrlatsexa=[thrlatdeg thrlatmin thrlatsec];
thrLat=dms2deg(thrlatsexa);

thrlon(end)=[];
thrlondeg=str2num(thrlon(1:2));
thrlonmin=str2num(thrlon(4:5));
thrlonsec=str2num(thrlon(7:8));
thrlonsexa=[thrlondeg thrlonmin thrlonsec];
thrLon=dms2deg(thrlonsexa);

thrH=str2num(thrheight);

thrPos=zeros(3,1)
[thrPos(1),thrPos(2),thrPos(3)]=geodToECEF(thrLat,thrLon,thrH);

 % Calculate FPAP point
deltaFPAPlat=s.NORMARC_8100.File.Records.Container.Container{1, 2}.Container.Array.Message{1, 1}.Structure.Data{1, 7}.Attributes.Value  
deltaFPAPlat(end)=[];
deltaFPAPlat_deg=str2num(deltaFPAPlat(1:2));
deltaFPAPlat_min=str2num(deltaFPAPlat(4:5));
deltaFPAPlat_sec=str2num(deltaFPAPlat(7:8));
deltaFPAPlat_sexa=[deltaFPAPlat_deg deltaFPAPlat_min deltaFPAPlat_sec];
deltaFPAPlat=dms2deg(deltaFPAPlat_sexa);

deltaFPAPlon=s.NORMARC_8100.File.Records.Container.Container{1, 2}.Container.Array.Message{1, 1}.Structure.Data{1, 8}.Attributes.Value;
deltaFPAPlon(end)=[];
deltaFPAPlon_deg=str2num(deltaFPAPlon(1:2));
deltaFPAPlon_min=str2num(deltaFPAPlon(4:5));
deltaFPAPlon_sec=str2num(deltaFPAPlon(7:8));
deltaFPAPlon_sexa=[deltaFPAPlon_deg deltaFPAPlon_min deltaFPAPlon_sec];
deltaFPAPlon=dms2deg(deltaFPAPlon_sexa);

dh1Lat = thrLat+deltaFPAPlat;
dh1Lon = thrLon+deltaFPAPlon;
dh1HorPos = zeros(3,1);
[dh1HorPos(1),dh1HorPos(2),dh1HorPos(3)] = geodToECEF(dh1Lat,dh1Lon,thrH);
dh1H = thrH + 50 * feet2m + norm(dh1HorPos - thrPos) * tan(glidePathAngle);


end

