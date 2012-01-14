# given a matrix of column vectors, x, return the 
# gram_matix M_ij = k(x_i, x_j)

function ret = gram_matrix(x, kernel = @(x1,x2)(exp(-norm(x1-x2)**2)), min_kern = 0)
  ret = zeros(size(x)(2));
  
  for i = 1:size(x)(2)
	 for j = 1:i
		k = kernel(x(:,i), x(:,j));
		if (k > min_kern)
			ret(i,j) = k;
			ret(j,i) = k;
		endif
	 endfor
  endfor
endfunction

