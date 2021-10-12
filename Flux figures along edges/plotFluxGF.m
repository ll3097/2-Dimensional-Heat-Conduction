% plot calculation solution of the flux at edge GF
load('qx.mat');
load('qy.mat');
load('Xcen.mat');
load('Ycen.mat');
load('Q.mat');
Qin=zeros(1,16)
GFn=[9,49:-1:36,5];
GFe=[87,76,128,84,123,136,134,132,124,106,140,121,120,113,147,116];
flux=Q(GFe');
Xgf=Xcen(GFe');Ygf=Ycen(GFe');
Qxgf=qx(GFe');Qygf=qy(GFe');
for i=1:16
x=Xgf(i),y=Ygf(i);
q_x=Qxgf(i),q_y=Qygf(i);
Csita1=q_x/sqrt(q_x^2+q_y^2);Ssita1=q_y/sqrt(q_x^2+q_y^2)
Csita0=x/sqrt(x^2+y^2);Ssita0=y/sqrt(x^2+y^2);
Csitap=Csita0*Csita1+Ssita0*Ssita1;
qin=flux(i)*Csitap;
Qin(i)=qin;
end
Csita=Ygf(16)/sqrt(Ygf(16)^2+Xgf(16)^2);
sita=(acos(Csita)/pi)*180; % sita is the angle between vector node#5 point to point(0,0) and y axial.
SITA=0:sita/15:sita;
plot(SITA,Qin,'LineWidth',1.5);
xlabel('the angle between normal heat flux vector and y axial in degree ');
ylabel('normal heat flux value');
title('normal heat flux on boundary GF')
hold on
SITA=0:sita/15:sita;
a=zeros(1,16);
for i=1:16
a(i)=1300;
end
plot(SITA,a,'r-','LineWidth',1.5);
legend('FE solution of normal heat flux','prescribed natural bc.')
grid on
