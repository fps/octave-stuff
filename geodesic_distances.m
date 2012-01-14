function ret = geodesic_distances(distance_matrix)
  dm = distance_matrix;
  cols = columns(distance_matrix);
  for i = 1:cols
	 for j = 1: cols
		test_set = zeros(1,cols);
		for k = 1:cols
		  dm(i,j) = min([dm(i,j), dm(i,k) + dm(k,j)]);
		endfor
	 endfor
  endfor
  ret = dm;
endfunction
