function ret = nwe(kern,x,t,x_p)
	ret = zeros(size(t)(1), size(x_p)(2));

	for k = 1:size(x_p)(2)
		nom = zeros(size(t)(1),1);
		denom = 0;
		for i = 1:size(t)(2)
			nom += kern(x(:,i),x_p(:,k)) * t(:,i);
			denom += kern(x(:,i),x_p(:,k));
		end
		if denom == 0
			ret(:,k) = zeros(size(t)(1), 1);
		else 
			ret(:,k) = nom * 1/denom;
		end
	end
end
