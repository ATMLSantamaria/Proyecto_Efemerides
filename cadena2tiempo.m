function [ tiempo ] = cadena2tiempo( ttexto )
% if ttexto(1)==0
dia=str2num(ttexto(1));
hora=str2num(ttexto(3:4));
minuto=str2num(ttexto(6:7));
segundo=str2num(ttexto(9:end));
    
    
% else
%     dia=str2num(ttexto(1));
%     hora=str2num(ttexto(3:4));
%     minuto=str2num(ttexto(6:7));
%     segundo=str2num(ttexto(9:end));
    
%ttiempo=calculo_tiempo(dia,hora,minuto,segundo);
tiempo=(dia*24+hora)*3600+minuto*60+segundo;

end

