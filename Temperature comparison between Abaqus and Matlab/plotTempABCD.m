% 1.plot the temperature variation along edge ABCD of the coarse mesh and
% the ones in ABAQUS
node=importdata('nodeinfo1.txt');
AbaqusABCD=importdata('ABAQUSTempABCD.txt');
AtempABCD=AbaqusABCD(:,3);
load('dcoarse.mat');
aculength=zeros(1,28); sumlengthAD=0;
Xad=zeros(1,29);Yad=zeros(1,29);length=zeros(1,28);
Nad=[4,1,66:1:81,6,16:1:24,7];
Xad=node(Nad',2);Yad=node(Nad',3);
for i=1:1:28
x1=Xad(i);y1=Yad(i);
x2=Xad(i+1);y2=Yad(i+1);
length(1,i)=sqrt((x2-x1)^2+(y2-y1)^2);
aculength(1,i)=sum(length(1:i))
sumlengthAD=sumlengthAD+length(1,i);
end
aculength=[0,aculength];
r=0.1:1.15/28:1.25
Tad=d(Nad');
plot(r,Tad,'k*-','LineWidth',1);
hold on
plot(r,-AtempABCD,'r.-');
xlabel('radius R');
ylabel('Temperature variation (Celsius)')
title('Temperature variation along the edge ABCD')
legend('coarse mesh')
grid on
hold on

% 2.plot the temperature variation along edge ABCD of the refined mesh
load('drefined.mat');
node=importdata('nodeinfo2.txt');
ABAQUStempABCD2=importdata('refinedTempABCD.txt');
aculength=zeros(1,58); sumlengthAD=0;
Xad=zeros(1,59);Yad=zeros(1,59);length=zeros(1,58);
Nad=[4,20,21,1,131:164,6,26:44,7];
Xad=node(Nad',2);Yad=node(Nad',3);
for i=1:1:58
x1=Xad(i);y1=Yad(i);
x2=Xad(i+1);y2=Yad(i+1);
length(1,i)=sqrt((x2-x1)^2+(y2-y1)^2);
aculength(1,i)=sum(length(1:i))
sumlengthAD=sumlengthAD+length(1,i);
end
aculength=[0,aculength];
r=0.1:1.15/58:1.25
Tad=d(Nad');
plot(r,Tad,'bo-','LineWidth',1);
hold on
plot(r,-ABAQUStempABCD2,'g-','LineWidth',1.3);
xlabel('radius R');
ylabel('Temperature variation (Celsius)')
title('Temperature variation along the edge ABCD(comparison)')
legend('coarse mesh MATLAB','coarse mesh ABAQUS','refined mesh MATLAB','refined mesh ABAQUS')
grid on
hold off