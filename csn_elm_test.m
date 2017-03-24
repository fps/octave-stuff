function ret = csn_elm_test
	inputs = 10 * rand(2,500);
	outputs = [sin(inputs(1,:)) + cos(inputs(2,:))];

	model = csn_eml_new(inputs, outputs, 50, 50);
	plot3(inputs(1,:), inputs(2,:), model.model_outputs, '@', inputs(1,:), inputs(2,:), outputs, '.')

end
