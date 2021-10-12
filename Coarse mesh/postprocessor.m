% plot temperature and flux
function postprocess(d);
include_flags

% plot the temperature field
if strcmpi(plot_temp,'yes')==1;  
%   d1 = d(ID);
   figure(2); 
   for e=1:nel
       XX = [x(IEN1(e,2))  x(IEN1(e,3))  x(IEN1(e,4))   x(IEN1(e,2))];
       YY = [y(IEN1(e,2))  y(IEN1(e,3))  y(IEN1(e,4))   y(IEN1(e,2))];
       dd = [d(IEN1(e,2)) d(IEN1(e,3)) d(IEN1(e,4))  d(IEN1(e,2))];
       patch(XX,YY,dd);hold on;  
   end
title('Temperature distribution'); xlabel('X'); ylabel('Y'); colorbar;
end


if strcmpi(compute_flux,'yes')==1;  
    fprintf(1,'\n                     Heat Flux at Center of Element \n')
    fprintf(1,'----------------------------------------------------------------------------- \n')
    for e=1:6
    fprintf(1,'Element  %d \n',e)
    fprintf(1,'-------------\n') 
    D=1*eye(1);
        get_flux(d,e,D);
    end
    for e=7:66
    fprintf(1,'Element  %d \n',e)
    fprintf(1,'-------------\n') 
    D=71*eye(1);
        get_flux(d,e,D);
    end
    for e=67:465
    fprintf(1,'Element  %d \n',e)
    fprintf(1,'-------------\n') 
    D=55*eye(1);
        get_flux(d,e,D);
    end
end