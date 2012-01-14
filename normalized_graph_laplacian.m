function ret = normalized_graph_laplacian(L)
  D = diag(diag(L));
  W = -(L - D);

  sqrtD = diag(1 ./ sqrt(diag(D)));

  ret = sqrtD * (D - W) * sqrtD;
endfunction