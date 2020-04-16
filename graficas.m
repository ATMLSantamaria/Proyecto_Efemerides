function graficas( ECEF_Px_s1,ECEF_Py_s1,ECEF_Pz_s1,ECEF_Px_s2,ECEF_Py_s2,ECEF_Pz_s2,ECEF_Px_s3,ECEF_Py_s3,ECEF_Pz_s3,ECEF_Px_s4,ECEF_Py_s4,ECEF_Pz_s4,ECEF_Px_s5,ECEF_Py_s5,ECEF_Pz_s5,ECEF_Px_s6,ECEF_Py_s6,ECEF_Pz_s6,ECEF_Px_s7,ECEF_Py_s7,ECEF_Pz_s7,ECEF_Px_s8,ECEF_Py_s8,ECEF_Pz_s8,ECEF_Px_s9,ECEF_Py_s9,ECEF_Pz_s9,ECEF_Px_s10,ECEF_Py_s10,ECEF_Pz_s10,ECEF_Px_s11,ECEF_Py_s11,ECEF_Pz_s11,ECEF_Px_s12,ECEF_Py_s12,ECEF_Pz_s12,ECEF_Px_s13,ECEF_Py_s13,ECEF_Pz_s13,ECEF_Px_s14,ECEF_Py_s14,ECEF_Pz_s14,ECEF_Px_s15,ECEF_Py_s15,ECEF_Pz_s15,ECEF_Px_s16,ECEF_Py_s16,ECEF_Pz_s16,ECEF_Px_s17,ECEF_Py_s17,ECEF_Pz_s17,ECEF_Px_s18,ECEF_Py_s18,ECEF_Pz_s18,ECEF_Px_s19,ECEF_Py_s19,ECEF_Pz_s19,ECEF_Px_s20,ECEF_Py_s20,ECEF_Pz_s20,ECEF_Px_s21,ECEF_Py_s21,ECEF_Pz_s21,ECEF_Px_s22,ECEF_Py_s22,ECEF_Pz_s22,ECEF_Px_s23,ECEF_Py_s23,ECEF_Pz_s23,ECEF_Px_s24,ECEF_Py_s24,ECEF_Pz_s24,RE )
%funcion que genera graficas
figure(1)
plot3(ECEF_Px_s1,ECEF_Py_s1,ECEF_Pz_s1)
hold on
figure(1)
plot3(ECEF_Px_s2,ECEF_Py_s2,ECEF_Pz_s2)
hold on
figure(1)
plot3(ECEF_Px_s3,ECEF_Py_s3,ECEF_Pz_s3)
hold on
figure(1)
plot3(ECEF_Px_s4,ECEF_Py_s4,ECEF_Pz_s4)
hold on
figure(1)
plot3(ECEF_Px_s5,ECEF_Py_s5,ECEF_Pz_s5)
hold on
figure(1)
plot3(ECEF_Px_s6,ECEF_Py_s6,ECEF_Pz_s6)
hold on
figure(1)
plot3(ECEF_Px_s7,ECEF_Py_s7,ECEF_Pz_s7)
hold on
figure(1)
plot3(ECEF_Px_s8,ECEF_Py_s8,ECEF_Pz_s8)
hold on
figure(1)
plot3(ECEF_Px_s9,ECEF_Py_s9,ECEF_Pz_s9)
hold on
figure(1)
plot3(ECEF_Px_s10,ECEF_Py_s10,ECEF_Pz_s10)
hold on
figure(1)
plot3(ECEF_Px_s11,ECEF_Py_s11,ECEF_Pz_s11)
hold on
figure(1)
plot3(ECEF_Px_s12,ECEF_Py_s12,ECEF_Pz_s12)
hold on
figure(1)
plot3(ECEF_Px_s13,ECEF_Py_s13,ECEF_Pz_s13)
hold on
figure(1)
plot3(ECEF_Px_s14,ECEF_Py_s14,ECEF_Pz_s14)
hold on
figure(1)
plot3(ECEF_Px_s15,ECEF_Py_s15,ECEF_Pz_s15)
hold on
figure(1)
plot3(ECEF_Px_s16,ECEF_Py_s16,ECEF_Pz_s16)
hold on
figure(1)
plot3(ECEF_Px_s17,ECEF_Py_s17,ECEF_Pz_s17)
hold on
figure(1)
plot3(ECEF_Px_s18,ECEF_Py_s18,ECEF_Pz_s18)
hold on
figure(1)
plot3(ECEF_Px_s19,ECEF_Py_s19,ECEF_Pz_s19)
hold on
figure(1)
plot3(ECEF_Px_s20,ECEF_Py_s20,ECEF_Pz_s20)
hold on
figure(1)
plot3(ECEF_Px_s21,ECEF_Py_s21,ECEF_Pz_s21)
hold on
figure(1)
plot3(ECEF_Px_s22,ECEF_Py_s22,ECEF_Pz_s22)
hold on
figure(1)
plot3(ECEF_Px_s23,ECEF_Py_s23,ECEF_Pz_s23)
hold on
figure(1)
plot3(ECEF_Px_s24,ECEF_Py_s24,ECEF_Pz_s24)
hold on
grid
[Xe Ye Ze]=sphere;
XE=Xe*RE;
YE=Ye*RE;
ZE=Ze*RE;
mesh(XE,YE,ZE)

end

