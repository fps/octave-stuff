function ret = floyd_warshall(D)
  ret = D;
  N = rows(D);
  for k = 1:N
	 for i = 1:N
		for j = 1:N
		  ret(i,j) = min(ret(i,j), ret(i,k) + ret(k,j));
		endfor
	 endfor
  endfor
endfunction
