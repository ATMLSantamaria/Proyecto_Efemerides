%%time chage
function [h,m]=sec2hms(t)
h=floor(t/3600);
m=(t-(h*3600))/60;
s=0;
end