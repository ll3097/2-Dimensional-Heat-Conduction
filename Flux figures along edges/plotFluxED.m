% plot calculation solution of the flux along edge ED
load('qx.mat');
load('qy.mat');
load('Xcen.mat');
load('Ycen.mat');
load('Q.mat');
Qin=zeros(1,3)
GFe=[62,64,66];
flux=Q(GFe');
Xgf=Xcen(GFe');Ygf=Ycen(GFe');
Qxgf=qx(GFe');Qygf=qy(GFe');
for i=1:3
x=Xgf(i),y=Ygf(i);
q_x=Qxgf(i),q_y=Qygf(i);
Csita1=q_x/sqrt(q_x^2+q_y^2);Ssita1=q_y/sqrt(q_x^2+q_y^2)
Csita0=x/sqrt(x^2+y^2);Ssita0=y/sqrt(x^2+y^2);
Csitap=Csita0*Csita1+Ssita0*Ssita1;
qin=flux(i)*Csitap;
Qin(i)=qin;
end
Csita=Ygf(3)/sqrt(Ygf(3)^2+Xgf(3)^2);
sita=(acos(Csita)/pi)*180; % sita is the angle between vector node#5 point to point(0,0) and y axial.
SITA=40.0612:(sita-40.0612)/2:sita;
plot(SITA,Qin);
xlabel('the angle of between normal heat flux vector and y axial in degree ');
ylabel('normal heat flux value');
title('normal heat flux on boundary ED');
hold on
a=zeros(1,3);
for i=1:3
a(i)=1800;
end
plot(SITA,a,'r-','LineWidth',1.5);
legend('FE solution of normal heat flux','prescribed natural bc.')
grid on