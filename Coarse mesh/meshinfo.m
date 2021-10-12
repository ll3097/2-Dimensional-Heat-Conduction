node=importdata('nodeinfo.txt');
element=importdata('eleinfo.txt');
x=node(:,2);
y=node(:,3);
scatter(x,y);
axis auto;
hold on
for i=1:max(size(node))
c=num2str(i);
text(x(i),y(i),c);
end
[m,n]=size(element);
for k=1:m;
line([node(element(k,2),2),node(element(k,3),2)],[node(element(k,2),3),node(element(k,3),3)]);  
hold on
line([node(element(k,3),2),node(element(k,4),2)],[node(element(k,3),3),node(element(k,4),3)]);
hold on
line([node(element(k,4),2),node(element(k,2),2)],[node(element(k,4),3),node(element(k,2),3)]);
hold on
end