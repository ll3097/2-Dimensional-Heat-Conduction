node=importdata('nodeinfo.txt');
element=importdata('eleinfo.txt');
A=zeros(8,3);%A is rubber
a=0;
for i=1:272
    x=node(i,2);
    y=node(i,3);
    if sqrt(x^2+y^2)<=0.16
        a=a+1;
        A(a,:)=[i,x,y];
    end
end
b=0;
B=zeros(228,3);
for i=1:272
    x=node(i,2);
    y=node(i,3);
    if sqrt(x^2+y^2)>=0.15 && sqrt(x^2+y^2)<=0.85
        b=b+1;
        B(b,:)=[i,x,y];%B is steel
    end
end
c=0;
C=zeros(44,3);
for i=1:272
    x=node(i,2);
    y=node(i,3);
    if sqrt(x^2+y^2)>=0.85
        c=c+1;
        C(c,:)=[i,x,y];%C is platinum
    end
end
C(41,:)=node(5,:);
C(42,:)=node(14,:);
C(43,:)=node(15,:);
C(44,:)=node(6,:);
Na=zeros(4,1);
Na=(A(:,1))';
Nb=zeros(228,1);
Nb=(B(:,1))';
Nc=zeros(38,1);
Nc=(C(:,1))';
ELE(:,:,465)=zeros(1,3);
Sa=zeros(6,1);
a=0;
for i=1:465
ELE(:,:,i)=element(i,2:4);
diff=setdiff(Na,ELE(:,:,i));
if numel(Na)-numel(diff)==3
    a=a+1;
    Sa(a,1)=element(i,1);
end
end
Sb=zeros(399,1);
b=0;
for i=1:465
ELE(:,:,i)=element(i,2:4);
diff=setdiff(Nb,ELE(:,:,i));
if numel(Nb)-numel(diff)==3
    b=b+1;
    Sb(b,1)=element(i,1);
end
end
Sc=zeros(60,1);
c=0;
for i=1:465
ELE(:,:,i)=element(i,2:4);
diff=setdiff(Nc,ELE(:,:,i));
if numel(Nc)-numel(diff)==3
    c=c+1;
    Sc(c,1)=element(i,1);
end
end
IEN=element;
Nodes=node;
N1=ones(6,1);
Pa=[Sa,N1];
N2=71.*ones(60,1);
Pc=[Sc,N2];
N3=55*ones(399,1);
Pb=[Sb,N3];
Kappa=[Pa;Pc;Pb];
B2=[3;12;13;4];
B1=[9,49,48,47,46,45,44,43,42,41,40,39,38,37,36,5,35,34,33,32,31,30,29,28,27,8,26,25,7,24,23,22,21,20,19,18,17,16,6]';
B3=[B1;B2]';
B4=[1:272];
B0=setdiff(B4,B3);
