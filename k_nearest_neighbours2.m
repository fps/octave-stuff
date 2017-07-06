# expects: D a distance matrix
# k a number of neighbours
function [ret, count, distances, mean_distances] = k_nearest_neighbours2(D, k)
	ret = zeros(rows(D),k);
    count = zeros(rows(D),1);
    distances = zeros(rows(D),k);
    mean_distances = zeros(rows(D),1);
	for row = 1:rows(D)
		[sorted sort_i] = sort(D(row,:));
        ret(row, :) = sort_i(2:1+k);
        for n = 1:k
            count(ret(row,n)) += 1;
            distances(row,n) = D(row, ret(row,n));
            mean_distances(row) += (1/k) * distances(row,n);
        end
	end
endfunction
