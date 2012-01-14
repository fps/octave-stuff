# returns an adjacency matrix
# expects: D a distance matrix
# k a number of neighbours
function ret = k_nearest_neighbours(D, k)
	ret = zeros(size(D));
	for i = 1:rows(D)
		ret(i,i) = 1;
		[sorted sort_i] = sort(D(i,:));
		for j = 1:k
			ret(i,sort_i(j)) = 1;			
		endfor
	endfor
endfunction
