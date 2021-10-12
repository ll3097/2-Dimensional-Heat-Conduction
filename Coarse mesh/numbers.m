    t = 0:pi/100:2*pi;
    y = exp(sin(t));
    h = plot(t,y,'YDataSource','y');
    for k = 1:0.01:10
       y = exp(sin(t.*k));
       refreshdata(h,'caller')
       drawnow
    end
    
    x=-8:0.5:8;
[XX,YY]=meshgrid(x);
r=sqrt(XX.^2+YY.^2)+eps;
Z=sin(r)./r;
surf(Z);
theAxes=axis;
fmat=moviein(1000);
for j=1:20;
surf(sin(2*pi*j/20)*Z,Z)
axis(theAxes)
fmat(:,j)=getframe;
end
movie(fmat,10)