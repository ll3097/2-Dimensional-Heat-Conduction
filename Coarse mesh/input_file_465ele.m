% Input Data for final project problem
node=importdata('nodeinfo.txt');
element=importdata('eleinfo.txt')
IEN1=element;
% Material property
k=zeros(465,1);
k(1:6)=1;
k(7:66)=71;
k(68:465)=55;
D1  =1*eye(2);
D2  =71*eye(2);
D3  =55*eye(2);% conductivity matrix

% Mesh specifications
nsd = 2;          % number of spacial dimensions
nnp = 272;         % number of total nodes
nel = 465;         % number of total elements
nen = 3;          % number of nodes on each element
ndof = 1;         % degrees-of-freedom per node
neq  = nnp*ndof;  % number of equations

f = zeros(neq,1);      % initialize nodal flux vector
d = zeros(neq,1);      % initialize nodal temperature vector
K = zeros(neq);        % initialize stiffness matrix

flags = zeros(neq,1);  % array to set B.C flags 
e_bc  = zeros(neq,1);  % essential B.C array
n_bc  = zeros(neq,1);  % natural B.C array


% essential BCs
nd =4;     % number of nodes on essential boundary

% Essential B.C.
flags(3:4)     = 2;      e_bc(3:4)      = 0.0;
flags(12:1:13) = 2;      e_bc(12:1:13)  = 0.0;

 
% plots
compute_flux = 'yes';
plot_mesh    = 'yes';
plot_nod     = 'yes';
plot_temp    = 'yes';
plot_flux    = 'yes';



% natural B.C  - defined on edges positioned on natural boundary
n_bc    = [  9   49   48   47   46   45   44   43   42   41   40   39   38   37   36   5   35   34   33   32   31   30   29   28   27    8   26   25             %node 1
             49  48   47   46   45   44   43   42   41   40   39   38   37   36   5   35   34   33   32   31   30   29   28   27   8    26   25   7
           1300 1300 1300 1300 1300 1300 1300 1300 1300 1300 1300 1300 1300 1300 1300 1800 1800 1800 1800 1800 1800 1800 1800 1800 1800 1800 1800 1800    %flux value at node 1
           1300 1300 1300 1300 1300 1300 1300 1300 1300 1300 1300 1300 1300 1300 1300 1800 1800 1800 1800 1800 1800 1800 1800 1800 1800 1800 1800 1800]   %flux value at node 2
nbe   = 28;         

% Natural B.C
B1=[9,49,48,47,46,45,44,43,42,41,40,39,38,37,36,5,35,34,33,32,31,30,29,28,27,8,26,25,7,24,23,22,21,20,19,18,17,16,6]';
flags(B1)=1;


% mesh generation
 mesh2d_465ele;

