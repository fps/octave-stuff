function ret = graph_laplacian2(xs, distance_threshold)
  D = zeros(columns(xs), columns(xs));
  A = zeros(columns(xs), columns(xs));

  for i = 1:columns(xs)
	 for j = i:columns(xs)
		if i != j
		  if (norm(xs(:,i) - xs(:,j)) < distance_threshold)
			 A(i,j) = A(j,i) = 1;
			 D(i,i) = D(i,i) + 1;
			 D(j,j) = D(j,j) + 1;
		  endif
		endif
	 endfor
  endfor
  L =  D - A;
  ret = L;
  for i = 1:columns(xs)
	 for j = i:columns(xs)
		ret(i,j) /= L(i,i);
	 endfor
  endfor
endfunction
