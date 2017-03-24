function ret = csn_elm_test
	inputs = 5 * rand(5,500);
	outputs = [sin(inputs(1,:)) + cos(inputs(2,:)) + sin(inputs(3,:)) + cos(inputs(4,:))];

	model = csn_elm_new(inputs, outputs, 200, 50);
	plot3(inputs(1,:), inputs(2,:), model.model_outputs, '@', inputs(1,:), inputs(2,:), outputs, '.')

	ret = model;
	model.model_rms
end
