%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Final Project                             %
% Lechen Li, Bo Zhang  Columbia University  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all; 

% include global variables
include_flags;
node=importdata('nodeinfo.txt');
element=importdata('eleinfo.txt');
IEN=element;
% Preprocessing
[K,f,d] = preprocessor;

% Evaluate element conductance matrix, nodal source vector and assemble
for e = 1:30       
    h=1;
    D=1*eye(2);
    sctr = IEN(e,2:4);
    
    ke = heat2Delem(e); 

    K(sctr,sctr) = K(sctr,sctr) + ke;   
end
for e = 31:230   
    h=71;
    D=71*eye(2);
    sctr = IEN(e,2:4);
    ke= heat2Delem(e); 

    K(sctr,sctr) = K(sctr,sctr) + ke;  
end
for e = 231:1894   
    h=55;
    D=55*eye(2);
    sctr = IEN(e,2:4);
    
    ke= heat2Delem(e); 

    K(sctr,sctr) = K(sctr,sctr) + ke; 
end
% Compute and assemble nodal boundary flux vector and point sources
f = src_and_flux(f);

% Solution
d = solvedr(K,f);

% Postprocessor
q=zeros(1,1894);
postprocessor(d);
