% Compute and assemble nodal boundary flux vector and point sources 

function f = src_and_flux(f);
include_flags;

% Assemble point sources 


% Compute nodal boundary flux vector
for i = 1:nbe
    
        fq      = [0 0]';            % initialize the nodal source vector
        node1   = n_bc(1,i);         % first node
        node2   = n_bc(2,i);         % second node
        n_bce   = n_bc(3,i);       % flux value at an edge
        
        
        x1 = x(node1); y1=y(node1);    % coord of the first node
        x2 = x(node2); y2=y(node2);    % coord of the second node
    
        leng = sqrt((x2-x1)^2 + (y2-y1)^2);  % edge length                                                           % integrate in psi direction (1D integration)                             
        N   = [0.5*leng,0.5*leng];       % 1D  shape functions in physical domain
            
        fq = N'*n_bce;                    % nodal flux
     
        fq = -fq;     % define flux as negative integrals
        
        % Assemble nodal flux vector
        f(node1) = f(node1) + fq(1);  
        f(node2) = f(node2) + fq(2);
                
end    

    
    


                
                
                
        
