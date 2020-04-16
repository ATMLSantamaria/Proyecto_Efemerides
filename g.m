function [x,y,z,test]=g(e,~,Inc,~,s_a,omega,w,M0,~,~,user,t,altitude)
%function for calculating g matrix elements

mu=398600*10^9;

a=s_a^2;%rad
n=sqrt(mu/(a^3));
R=6371000; %m
difference=100;
threshold=0.001;
Mold=M0+n*t;
Enew=Mold;

while (difference>threshold)
   Eold=Enew;
   Enew=Eold-((Eold-e*sin(Eold)-Mold)/(1-e*cos(Eold)));
   Mnew=Enew-(e*sin(Enew));
   difference=abs(Mnew-Mold);
end
%Enew(j)=Enew;

%true anoml
Vu=2*atan(sqrt((1-e)/(1+e))*tan(Enew/2));

rk=a*(1-e*cos(Enew));

ik=Inc; %angle of inclination

xp=rk*cos(Vu+w);%x position in plane

yp=rk*sin(Vu+w);%y position in plane

xs=xp*cos(omega)-yp*cos(ik)*sin(omega);% ECEf x postion

ys=xp*sin(omega)+yp*cos(ik)*cos(omega);% ECEF y postion

zs=yp*sin(ik);% ECEF z postion

xu=user(1,1);
yu=user(2,1);
zu=user(3,1);

x0=0;
y0=0;
z0=0;

ps= pseduo_range(xs,ys,zs,xu,yu,zu);% pseudo range

a=pseduo_range(xs,ys,zs,x0,y0,z0);
b=pseduo_range(x0,y0,z0,xu,yu,zu);
c=ps;
B=R;
C=sqrt(a^2-B^2);
alfa=acos((a^2+C^2-B^2)/(2*a*C))*(180/pi);
bet=acos((b^2-a^2+c^2)/(2*b*c));
beta=bet*180/pi;
if altitude<800
if beta>110
    if beta<230
        test=1;
    else 
        test=0;
    end 
else
    test=0;
end
end
    alfa2=360-alfa;
if altitude>=800
    if alfa<beta
        if alfa2>beta
            test=1;
        else 
            test=0;
        end
    else
        test=0;
    end
end
            
x=(xs-xu)/ps;
y=(ys-yu)/ps;
z=(zs-zu)/ps;

