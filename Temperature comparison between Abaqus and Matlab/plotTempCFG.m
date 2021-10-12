% plot the temperature variation along edge CFG
node=importdata('nodeinfo1.txt');
load('dcoarse.mat');
A=importdata('ABAQUSTempCFG.txt');
aculength=zeros(1,18); sumlengthAD=0;
Xcg=zeros(1,19);Ycg=zeros(1,19);length=zeros(1,18);
Nad=[6,5,14,5,36:49,9];
Xcg=node(Nad',2);Ycg=node(Nad',3);
for i=1:1:18
x1=Xcg(i);y1=Ycg(i);
x2=Xcg(i+1);y2=Ycg(i+1);
length(1,i)=sqrt((x2-x1)^2+(y2-y1)^2);
aculength(1,i)=sum(length(1:i))
sumlengthAD=sumlengthAD+length(1,i);
end
Csita=Ycg(19)/sqrt(Ycg(19)^2+Xcg(19)^2);
sita=(acos(Csita)/pi)*180; % sita is the angle between vector node#5 point to point(0,0) and y axial.
SITA=45:45/18:90;
Tad=d(Nad');
plot(SITA,Tad,'k*-','LineWidth',2);
hold on
plot(SITA,-A,'r.-');
hold on

node=importdata('nodeinfo2.txt');
load('drefined.mat');
B=importdata('refinedTempCFG.txt');
aculength=zeros(1,35); sumlengthAD=0;
Xcg=zeros(1,36);Ycg=zeros(1,36);length=zeros(1,35);
Nad=[6,25:-1:22,5,68:1:96,9];
Xcg=node(Nad',2);Ycg=node(Nad',3);
for i=1:1:35
x1=Xcg(i);y1=Ycg(i);
x2=Xcg(i+1);y2=Ycg(i+1);
length(1,i)=sqrt((x2-x1)^2+(y2-y1)^2);
aculength(1,i)=sum(length(1:i))
sumlengthAD=sumlengthAD+length(1,i);
end
Csita=Ycg(36)/sqrt(Ycg(36)^2+Xcg(36)^2);
sita=(acos(Csita)/pi)*180; % sita is the angle between vector node#5 point to point(0,0) and y axial.
SITA=45:45/35:90;
aculength=[0,aculength];
Tad=d(Nad');
plot(SITA,Tad,'bo-','LineWidth',2);
hold on
plot(SITA,-B,'g-','LineWidth',1.3);
xlabel('the angle between the vector of each node coordinate and x axial in degree ');
ylabel('Temperature variation (Celsius)');
title('Temperature variation along the edge CFG(comparison)');
grid on
legend('coarse mesh MATLAB','coarse mesh ABAQUS','refined mesh MATLAB','refined mesh ABAQUS');
hold off
