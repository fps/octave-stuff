# returns an adjacency matrix
# expects: D a distance matrix
# k a number of neighbours
function ret = k_nearest_neighbours(D, k)
	ret = zeros(size(D));
	for row = 1:rows(D)
		ret(row,row) = 0;
		[sorted sort_i] = sort(D(row,:));
		for col = 2:k+1
			ret(row,sort_i(col)) = 1;			
		endfor
	endfor
endfunction
