function ret = double_center_matrix(m)
  ret = m;
  col_mean = mean(m);
  row_mean = mean(m')';

  mean_mean = mean(mean(m));

  for row = 1:rows(m)
	 ret(row,:) = m(row,:) - row_mean(row);
  endfor

  for col = 1:columns(m)
	 ret(:,col) = ret(:,col) - col_mean(col);
  endfor

  ret += mean_mean;
endfunction