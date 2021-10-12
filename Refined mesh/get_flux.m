function get_flux(d,e,D);
include_flags;


% get coordinates of element nodes 
sctr = IEN(e,2:4);  
de = d(sctr);    % extract temperature at  element nodes
C  = [x(sctr), y(sctr)]; 
nodenum=IEN(e,2:4);
x1=x(nodenum(1));y1=y(nodenum(1));
x2=x(nodenum(2));y2=y(nodenum(2));
x3=x(nodenum(3));y3=y(nodenum(3));

% compute flux vector

       B=BmatHeat2D(x1,y1,x2,y2,x3,y3); 
       q=-D*B*de;                  % compute the flux 
        
       q_normalized = 0.1 * q(1:2,1) ./ norm(q(1:2,1));
       q_x=q(1,1);
       q_y=q(2,1);
       q(1,e)=sqrt(q_x^2+q_y^2);
       X=(x1+x2+x3)/3;
       Y=(y1+y2+y3)/3;
      
%        #x-coord  y-coord  q_x(eta,psi)  q_y(eta,psi)
flux_e1  = [X        Y        q_x            q_y];
fprintf(1,'\t\t\tx-coord\t\t\t\ty-coord\t\t\t\tq_x\t\t\t\t\tq_y\n');
fprintf(1,'\t\t\t%f\t\t\t%f\t\t\t%f\t\t\t%f\n',flux_e1');

if strcmpi(plot_flux,'yes')==1 & strcmpi(plot_mesh,'yes') ==1;  
    figure(1); 
    quiver(X,Y,q_normalized(1,1),q_normalized(2,1),'k');
    plot(X,Y,'rx');
    title('Heat Flux');
    xlabel('X');
    ylabel('Y');
end

