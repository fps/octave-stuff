function ret = graph_laplacian(xs, distance_threshold)
  n = columns(xs);
  D = zeros(n, n);
  A = zeros(n, n);

  ret = zeros(n, n);

  for i = 1:n
	 for j = i:n
		if i != j
		  if (norm(xs(:,i) - xs(:,j)) < distance_threshold)
			 A(i,j) = A(j,i) = 1;
			 D(i,i) = D(i,i) + 1;
			 D(j,j) = D(j,j) + 1;
		  endif
		endif
	 endfor
  endfor
  ret =  D - A;
endfunction
