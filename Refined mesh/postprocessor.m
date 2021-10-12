% plot temperature and flux
function postprocess(d);
include_flags

% plot the temperature field
if strcmpi(plot_temp,'yes')==1;  
%   d1 = d(ID);
   figure(2); 
   for e=1:nel
       XX = [x(IEN(e,2))  x(IEN(e,3))  x(IEN(e,4))   x(IEN(e,2))];
       YY = [y(IEN(e,2))  y(IEN(e,3))  y(IEN(e,4))   y(IEN(e,2))];
       dd = [d(IEN(e,2)) d(IEN(e,3)) d(IEN(e,4))  d(IEN(e,2))];
       patch(XX,YY,dd);hold on;  
   end
title('Temperature distribution'); xlabel('X'); ylabel('Y'); colorbar;
end

%Compute flux at gauss points
if strcmpi(compute_flux,'yes')==1;  
    fprintf(1,'\n                     Heat Flux at Gauss Points \n')
    fprintf(1,'----------------------------------------------------------------------------- \n')
    for e=1:30
    fprintf(1,'Element  %d \n',e)
    fprintf(1,'-------------\n') 
    D=1*eye(1);
        get_flux(d,e,D);
    end
    for e=31:230
    fprintf(1,'Element  %d \n',e)
    fprintf(1,'-------------\n') 
    D=71*eye(1);
        get_flux(d,e,D);
    end
    for e=231:1894
    fprintf(1,'Element  %d \n',e)
    fprintf(1,'-------------\n') 
    D=55*eye(1);
        get_flux(d,e,D);
    end
end