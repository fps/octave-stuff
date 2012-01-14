# row vector to matrix per row
function ret = v2m(v, r)
  cols = length(v)/r;
  ret = zeros(r, cols);
  
  
  for row = 1:r
	 v((row*cols-r):((row+1)*cols-r));
  endfor
endfunction