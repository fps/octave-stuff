# xs is a matrix of column vectors holding the datapoints
function ret = kernel_density(xs, kernel = @(x1, x2)(exp(-norm(x1 - x2)**2)))
  N = columns(xs);
  
  ret = zeros(1,N);

  for row = 1:N
	 for col = 1:N
		ret(col) += kernel(xs(:,row), xs(:,col));
	 endfor
  endfor
endfunction