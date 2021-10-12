% Mesh2D ror final

function mesh2d_465ele
include_flags;
node=importdata('nodeinfo.txt');
element=importdata('eleinfo.txt');
% Node #, x coords
x=node(:,2); 
% Node #, y coords
y=node(:,3);
% Element #, connectivity
IEN1

plotmesh;


fprintf(1,'  Mesh Params \n');
fprintf(1,'--------------- \n');
fprintf(1,'No. of Elements  %d \n',nel);
fprintf(1,'No. of Nodes     %d \n',nnp);
fprintf(1,'No. of Equations %d \n\n',neq);


