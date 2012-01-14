# d is a density estimator (a row vector of estimated densities at the
# data points, i.e. a d(i) is the estimated density around point x(:,i).
# A is an adjacency matrix with a 1 at entry i,j if points i and j are neighbours.
function ret = simple_cluster(d, A)
	N = columns(d);
	ret = 1:N;
	for i = 1:N;
		max_index = (i);
		max_density = d(ret(i));
		while(true)
			[new_max_density new_max_index] = max(d .* A(max_index,:));
			if new_max_density <= max_density
				break
			endif
			if new_max_index == max_index
				break
			endif
			max_index = new_max_index;
			max_density = new_max_density;
		endwhile
		ret(i) = max_index;
	endfor
endfunction
