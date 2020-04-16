function graficas2( ECEF_P_T,RE )
%funcion que genera graficas
for satt=1:24
    hold on
    aa=ECEF_P_T(satt,:,:);
    bb=squeeze(aa);
    figure(4)
    plot3(bb(1,:),bb(2,:),bb(3,:))
    hold on
end
grid
[Xe,Ye,Ze]=sphere;
XE=Xe*RE;
YE=Ye*RE;
ZE=Ze*RE;
mesh(XE,YE,ZE)

end