function [ tiempo ] = calculo_tiempo( dia,hora,minuto,segundo )

tiempo=(dia*24+hora)*3600+minuto*60+segundo;

end

