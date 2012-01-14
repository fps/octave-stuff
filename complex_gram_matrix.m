# given a matrix of column vectors, x, return the 
# gram_matix M_ij = k(x_i, x_j)

function ret = complex_gram_matrix(x, min_kern = 0, kernel = @(x1,x2)(exp(-norm(x1-x2)**2)))
  ret = zeros(size(x)(2));
  
  for row = 1:size(x)(2)
	 for col = 1:row

		k = kernel(x(:,row), x(:,col));
		if (k > min_kern)
			ret(row,col) = - k * i;
			ret(col,row) = k * i;
		endif
		if row == col; ret(row, col) = 1; endif
	 endfor
  endfor
endfunction

