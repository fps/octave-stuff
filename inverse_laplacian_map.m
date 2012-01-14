function ret = inverse_laplacian_map(L, dim)
  n = columns(L);
  ret = zeros(dim, n);

  pL = pinv(L, 0.0000001);
  ret(1,:) = (pL * ones(n,1))';

  if dim == 1
	 return;
  endif

  for dim = 2:dim
	 
  endfor
endfunction