 function ke = heat2Delem(e)
include_flags;

ke  = zeros(nen,nen);    % initialized element conductance matrix

% get coordinates of element nodes 

eleNodes=IEN1(e,2:4);
a1=node(eleNodes(1,1),2);
b1=node(eleNodes(1,1),3);
a2=node(eleNodes(1,2),2);
b2=node(eleNodes(1,2),3);
a3=node(eleNodes(1,3),2);
b3=node(eleNodes(1,3),3);
B=BmatHeat2D(a1,b1,a2,b2,a3,b3); % derivative of the shape functions
ke=(h*(((a2*b3-a3*b2)-(a1*b3-a3*b1)+(a1*b2-a2*b1))/2)).*B'*B;% element conductance matrix


% compute element conductance matrix and nodal flux vector 





