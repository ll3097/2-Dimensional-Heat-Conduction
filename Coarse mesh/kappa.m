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
