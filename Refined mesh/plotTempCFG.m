% plot the temperature variation along edge CFG
importdata('nodeinfo.txt');
aculength=zeros(1,18); sumlengthAD=0;
Xad=zeros(1,19);Yad=zeros(1,19);length=zeros(1,18);
Nad=[4,1,66:1:81,6,16:1:24,7];
Xad=node(Nad',2);Yad=node(Nad',3);
for i=1:1:18
x1=Xad(i);y1=Yad(i);
x2=Xad(i+1);y2=Yad(i+1);
length(1,i)=sqrt((x2-x1)^2+(y2-y1)^2);
aculength(1,i)=sum(length(1:i))
sumlengthAD=sumlengthAD+length(1,i);
end
aculength=[0,aculength];
Tad=d(Nad');
plot(aculength,Tad,'k*-','LineWidth',2);
xlabel('Length of the edge CFG');
ylabel('Temperature variation (Celsius)');
title('Temperature variation along the edge CFG');
grid on
legend('coarse mesh');