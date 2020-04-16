%function for pseduo range
function [pseduo] = pseduo_range(Xs,Ys,Zs,Xu,Yu,Zu)
pseduo=sqrt((Xs-Xu)^2+(Ys-Yu)^2+(Zs-Zu)^2);
