# D is a distance matrix and n is the index of the element
# which is the "center" of the data
function ret = gram_matrix_from_distances(D, n)
	ret = zeros(rows(D), rows(D));
	for i = 1:rows(D)
		for j = 1:rows(D)
			ret(i,j) = 0.5 * ((D(n,i)^2 + D(n,j)^2) - D(i,j)^2);
			#ret(i,j) = 0.5 * (- D(i,j)^2);
		endfor
	endfor
endfunction
