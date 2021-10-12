% Firstly we do the calculation of average band width of the stiffness
% matrix for corse mesh.
load Kcoarse;
BW1=zeros(272,1);
for i=1:272;
    for j=1:272;
        A=K(i,1:j);
        a=any(A);
        if a==1
        break
        end 
        BW1(i,1)=j;
    end
end
BW2=zeros(272,1);
for i=1:272;
    for j=272:-1:1;
        A=K(i,j:272);
        a=any(A);
        if a==1
        break
        end 
        BW2(i,1)=272-j+1;
    end
end 
BW=272.*ones(272,1)-BW1-BW2;
ABW1=sum(BW)/272;  
fprintf('The average band width of global stiffness matrix for coarse mesh is %f\n',ABW1);

% Next we do the calculation of average band width of the stiffness
% matrix for corse mesh.
load Krefined;
BW3=zeros(1026,1);
for i=1:1026;
    for j=1:1026;
        A=K(i,1:j);
        a=any(A);
        if a==1
        break
        end 
        BW3(i,1)=j;
    end
end
BW4=zeros(1026,1);
for i=1:1026;
    for j=1026:-1:1;
        A=K(i,j:1026);
        a=any(A);
        if a==1
        break
        end 
        BW4(i,1)=1026-j+1;
    end
end 
BW=1026.*ones(1026,1)-BW3-BW4;
ABW2=sum(BW)/1026;   
fprintf('The average band width of global stiffness matrix for refined mesh is %f',ABW2);