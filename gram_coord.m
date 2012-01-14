# for all points x_p return the gram coordinates as vector.
# The reference points for the coordinates are the xs

function ret = gram_coord(x_p, xs, kernel = @(x1,x2)(exp(-norm(x1-x2)**2)))
	#ret = zeros(size(xs)(2)+1, size(x_p)(2));
	ret = zeros(size(xs)(2), size(x_p)(2));
	for k = 1:size(x_p)(2)
		for i = 1:size(xs)(2)
			ret(i,k) = kernel(x_p(:,k),xs(:,i));
		end
		#ret(size(xs)(2) + 1,k) = 1;
	end
end
