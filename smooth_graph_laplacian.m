function ret = smooth_graph_laplacian(xs, sigma1, sigma2, threshold)
  n = columns(xs);
  ret = zeros(n,n);
  for current = 1:n
	 for other = 1:n
		current_x = xs(:, current);
		other_x = xs(:, other);
		distance = norm(current_x - other_x);
		if (distance < threshold && current != other)
		  ret(current, other) = normal_pdf(distance, 0, sigma1) - normal_pdf(distance, 0, sigma2);
		else
		  ret(current, other) = 0;
		endif
	 endfor
	 s = -sum(ret(current,:));
	 ret(current, current) = s;
  endfor
endfunction