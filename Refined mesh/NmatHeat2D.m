% Shape function 
 
function N = NmatHeat2D(a1,b1,a2,b2,a3,b3,a,b)
       N1=(1/(2*(((a2*b3-a3*b2)-(a1*b3-a3*b1)+(a1*b2-a2*b1))/2)))*(a2*b3-a3*b2+(b2-b3)*a+(a3-a2)*b);
       N2=(1/(2*(((a2*b3-a3*b2)-(a1*b3-a3*b1)+(a1*b2-a2*b1))/2)))*(a3*b1-a1*b3+(b3-b1)*a+(a1-a3)*b);
       N3=(1/(2*(((a2*b3-a3*b2)-(a1*b3-a3*b1)+(a1*b2-a2*b1))/2)))*(a1*b2-a2*b1+(b1-b2)*a+(a2-a1)*b);
       N=[N1,N2,N3]; % shape functions

