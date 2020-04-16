function [ S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,ephemeris ] = readalmanac( filename )
%In this function i want to read from almanac in excel format that i export
%from a .txt format that i find in web of us coast

format long %con esto hago que se cojan todos los decimales
%1 satelite
a=xlsread(filename,'A2:B14'); %cuando este scrip se convierta en variable
%sustituire 'almanac.xlsx' por el file name, y filename vendra como input
%del programa principal
S1=[];
S1=[a(3,1),a(4,1),a(5,1),a(6,1),a(7,1),a(8,1),a(9,1),a(10,1),a(11,1),a(12,1)];
%2 satelite
b=xlsread(filename,'A17:B29');
S2=[];
S2=[b(3,1),b(4,1),b(5,1),b(6,1),b(7,1),b(8,1),b(9,1),b(10,1),b(11,1),b(12,1)];
%3 satelite
c=xlsread(filename,'A32:B44');
S3=[];
S3=[c(3,1),c(4,1),c(5,1),c(6,1),c(7,1),c(8,1),c(9,1),c(10,1),c(11,1),c(12,1)];
%4 satelite
d=xlsread(filename,'A47:B59');
S4=[];
S4=[d(3,1),d(4,1),d(5,1),d(6,1),d(7,1),d(8,1),d(9,1),d(10,1),d(11,1),d(12,1)];
%5 satelite
e=xlsread('almanac.xlsx','A62:B74');
S5=[];
S5=[e(3,1),e(4,1),e(5,1),e(6,1),e(7,1),e(8,1),e(9,1),e(10,1),e(11,1),e(12,1)];
%6 satelite
f=xlsread('almanac.xlsx','A77:B89');
S6=[];
S6=[f(3,1),f(4,1),f(5,1),f(6,1),f(7,1),f(8,1),f(9,1),f(10,1),f(11,1),f(12,1)];
%7 satelite
g=xlsread('almanac.xlsx','A92:B104');
S7=[];
S7=[g(3,1),g(4,1),g(5,1),g(6,1),g(7,1),g(8,1),g(9,1),g(10,1),g(11,1),g(12,1)];
%8 satelite
h=xlsread('almanac.xlsx','A107:B119');
S8=[];
S8=[h(3,1),h(4,1),h(5,1),h(6,1),h(7,1),h(8,1),h(9,1),h(10,1),h(11,1),h(12,1)];
%9 satelite
i=xlsread('almanac.xlsx','A122:B134');
S9=[];
S9=[i(3,1),i(4,1),i(5,1),i(6,1),i(7,1),i(8,1),i(9,1),i(10,1),i(11,1),i(12,1)];
%10 satelite
j=xlsread('almanac.xlsx','A137:B149');
S10=[];
S10=[j(3,1),j(4,1),j(5,1),j(6,1),j(7,1),j(8,1),j(9,1),j(10,1),j(11,1),j(12,1)];
%11 satelite
k=xlsread('almanac.xlsx','A152:B164');
S11=[];
S11=[k(3,1),k(4,1),k(5,1),k(6,1),k(7,1),k(8,1),k(9,1),k(10,1),k(11,1),k(12,1)];
%12 satelite
l=xlsread('almanac.xlsx','A167:B179');
S12=[];
S12=[l(3,1),l(4,1),l(5,1),l(6,1),l(7,1),l(8,1),l(9,1),l(10,1),l(11,1),l(12,1)];
%13 satelite
m=xlsread('almanac.xlsx','A182:B194');
S13=[];
S13=[m(3,1),m(4,1),m(5,1),m(6,1),m(7,1),m(8,1),m(9,1),m(10,1),m(11,1),m(12,1)];
%14 satelite
n=xlsread('almanac.xlsx','A197:B209');
S14=[];
S14=[n(3,1),n(4,1),n(5,1),n(6,1),n(7,1),n(8,1),n(9,1),n(10,1),n(11,1),n(12,1)];
%15 satelite
o=xlsread('almanac.xlsx','A212:B224');
S15=[];
S15=[o(3,1),o(4,1),o(5,1),o(6,1),o(7,1),o(8,1),o(9,1),o(10,1),o(11,1),o(12,1)];
%16 satelite
p=xlsread('almanac.xlsx','A227:B239');
S16=[];
S16=[p(3,1),p(4,1),p(5,1),p(6,1),p(7,1),p(8,1),p(9,1),p(10,1),p(11,1),p(12,1)];
%17 satelite
r=xlsread('almanac.xlsx','A242:B254');
S17=[];
S17=[r(3,1),r(4,1),r(5,1),r(6,1),r(7,1),r(8,1),r(9,1),r(10,1),r(11,1),r(12,1)];
%18 satelite
s=xlsread('almanac.xlsx','A257:B269');
S18=[];
S18=[s(3,1),s(4,1),s(5,1),s(6,1),s(7,1),s(8,1),s(9,1),s(10,1),s(11,1),s(12,1)];
%19 satelite
t=xlsread('almanac.xlsx','A272:B284');
S19=[];
S19=[t(3,1),t(4,1),t(5,1),t(6,1),t(7,1),t(8,1),t(9,1),t(10,1),t(11,1),t(12,1)];
%20 satelite
u=xlsread('almanac.xlsx','A287:B299');
S20=[];
S20=[u(3,1),u(4,1),u(5,1),u(6,1),u(7,1),u(8,1),u(9,1),u(10,1),u(11,1),u(12,1)];
%21 satelite
v=xlsread('almanac.xlsx','A302:B314');
S21=[];
S21=[v(3,1),v(4,1),v(5,1),v(6,1),v(7,1),v(8,1),v(9,1),v(10,1),v(11,1),v(12,1)];
%22 satelite
q=xlsread('almanac.xlsx','A317:B329');
S22=[];
S22=[q(3,1),q(4,1),q(5,1),q(6,1),q(7,1),q(8,1),q(9,1),q(10,1),q(11,1),q(12,1)];
%23 satelite
w=xlsread('almanac.xlsx','A332:B344');
S23=[];
S23=[w(3,1),w(4,1),w(5,1),w(6,1),w(7,1),w(8,1),w(9,1),w(10,1),w(11,1),w(12,1)];
%24 satelite
x=xlsread('almanac.xlsx','A347:B359');
S24=[];
S24=[x(3,1),x(4,1),x(5,1),x(6,1),x(7,1),x(8,1),x(9,1),x(10,1),x(11,1),x(12,1)];

%Ahora podria meter estos datos en una matriz correspondiente a cada vector
%traspuesto que contenga los datos de los 24 satelites (luego lo ampliare a
%32, pero de momento la Standard Constellation me sirve
ephemeris=[];
%end
ephemeris=[S1' S2' S3' S4' S5' S6' S7' S8' S9' S10' S11' S12' S13' S14' S15' S16' S17' S18' S19' S20' S21' S22' S23' S24'];
end