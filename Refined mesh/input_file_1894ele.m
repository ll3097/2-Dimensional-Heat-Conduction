% Input Data for final project
node=importdata('nodeinfo.txt');
element=importdata('eleinfo.txt');
IEN=element;
% Material property
k=zeros(1894,1);
k(1:30)=1;
k(31:230)=71;
k(231:1894)=55;
D1  =1*eye(2);
D2  =71*eye(2);
D3  =55*eye(2);% conductivity matrix

% Mesh specifications
nsd = 2;          % number of spacial dimensions
nnp = 1026;         % number of total nodes
nel = 1894;         % number of total elements
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
nd =6;     % number of nodes on essential boundary

% Essential B.C.
flags(3:4)     = 2;      e_bc(3:4)      = 0.0;
flags(16:1:19) = 2;      e_bc(16:1:19)  = 0.0;

 
% plots
compute_flux = 'yes';
plot_mesh    = 'yes';
plot_nod     = 'yes';
plot_temp    = 'yes';
plot_flux    = 'yes';



% natural B.C  - defined on edges positioned on natural boundary
n_bc    = [  9     96    95   94     93    92    91    90    89    88    87    86    85    84    83    82    81    80    79    78    77    76    75    74    73    72    71    70    69    68     5    67    66    65    64    63    62    61    60    59    58    57    56    55    54    53   52    51    50    49     8     48    47    46    45        %node 1
            96     95    94   93     92    91    90    89    88    87    86    85    84    83    82    81    80    79    78    77    76    75    74    73    72    71    70    69    68    5     67    66    65    64    63    62    61    60    59    58    57    56    55    54    53    52   51    50    49     8     48    47    46    45    7
           1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800     %flux value at node 1
           1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1300  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800  1800]   %flux value at node 2

nbe=55;         

% Natural B.C



% mesh generation
 mesh2d_1894ele;

