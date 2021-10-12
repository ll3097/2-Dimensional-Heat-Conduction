% plot calculation solution of the flux at edge FE
load('qx.mat');
load('qy.mat');
load('Xcen.mat');
load('Ycen.mat');
load('Q.mat');
Qin=zeros(1,10)
GFe=[7,13,19,25,31,37,43,49,55,61];
flux=Q(GFe');
Xgf=Xcen(GFe');Ygf=Ycen(GFe');
Qxgf=qx(GFe');Qygf=qy(GFe');
for i=1:10
x=Xgf(i),y=Ygf(i);
q_x=Qxgf(i),q_y=Qygf(i);
Csita1=q_x/sqrt(q_x^2+q_y^2);Ssita1=q_y/sqrt(q_x^2+q_y^2)
Csita0=x/sqrt(x^2+y^2);Ssita0=y/sqrt(x^2+y^2);
Ssitap=Ssita0*Csita1-Csita0*Ssita1;
qin=flux(i)*(-Ssitap);
Qin(i)=qin;
end
R=0.85:0.4/9:1.25;
plot(R,Qin);
xlabel('radius R (meter)');
ylabel('normal heat flux value');
title('normal heat flux on boundary FE');
hold on
R=0.85:0.4/9:1.25;
b=zeros(1,10);
for i=1:10
b(i)=1800;
end
plot(R,b,'r-','LineWidth',1.5);
legend('FE solution of normal heat flux','prescribed natural bc.')
grid on