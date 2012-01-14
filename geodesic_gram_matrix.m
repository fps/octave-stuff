function ret = geodesic_gram_matrix(g, kernel = @(d)(exp(-norm(d)**2)))
  ret = g;
  for row = 1:rows(g)
	 for col = 1:columns(g)
		ret(row,col) = kernel(g(row,col));
	 endfor
  endfor
endfunction
