# We expect xs to be column vectors
function ret = distance_matrix(xs, max_dist = inf, default_distance = inf, metric = @(x1,x2) (norm(x1 - x2)))
  for i = 1:columns(xs)
	 for j = 1:i
		dist = metric(xs(:,i), xs(:,j));
		if (dist < max_dist)
		  ret(i,j) = dist;
		  ret(j,i) = dist;
		else
		  ret(i,j) = default_distance;
		  ret(j,i) = default_distance;
		endif
	 endfor
  endfor
endfunction
