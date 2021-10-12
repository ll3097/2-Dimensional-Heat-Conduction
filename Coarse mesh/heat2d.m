%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Project        %
% Lechen Li, Bo Zhang, Columbia University         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all; 

% include global variables
include_flags;
node=importdata('nodeinfo.txt');
element=importdata('eleinfo.txt');
IEN1=element;
% Preprocessing
[K,f,d] = preprocessor;

% Evaluate element conductance matrix, nodal source vector and assemble
for e = 1:6       
    h=1;
    D=1*eye(2);
    sctr = IEN1(e,2:4);
    
    ke = heat2Delem(e); 

    K(sctr,sctr) = K(sctr,sctr) + ke;   
end
for e = 7:66   
    h=71;
    D=71*eye(2);
    sctr = IEN1(e,2:4);
    ke= heat2Delem(e); 

    K(sctr,sctr) = K(sctr,sctr) + ke;  
end
for e = 67:465   
    h=55;
    D=55*eye(2);
    sctr = IEN1(e,2:4);
    
    ke= heat2Delem(e); 

    K(sctr,sctr) = K(sctr,sctr) + ke; 
end
% Compute and assemble nodal boundary flux vector and point sources
f = src_and_flux(f);

% Solution
d = solvedr(K,f);

% Postprocessor
qx=zeros(465,1);
qy=zeros(464,1);
Q=zeros(465,1);
Xcen=zeros(465,1);
Ycen=zeros(456,1);
postprocessor(d);
