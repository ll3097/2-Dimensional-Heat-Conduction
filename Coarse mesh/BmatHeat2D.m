% B matrix function
 
function B = BmatHeat2D(a1,b1,a2,b2,a3,b3)    
      % Calculate the Grad(N) matrix
      B=(1/((a2*b3-a3*b2)-(a1*b3-a3*b1)+(a1*b2-a2*b1)))*[b2-b3,b3-b1,b1-b2;a3-a2,a1-a3,a2-a1];
