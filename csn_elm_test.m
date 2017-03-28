function ret = csn_elm_test(no_train, no_test)
	inputs = 10 * rand(2,no_train) + 100;
	outputs = [sin(inputs(1,:)) + cos(inputs(2,:))];

	test_inputs = 10 * rand(2,no_test) + 100;
	test_outputs = [sin(test_inputs(1,:)) + cos(test_inputs(2,:))];

	model = csn_elm_new(inputs, outputs, 98, test_inputs, test_outputs);
	plot3(test_inputs(1,:), test_inputs(2,:), model.model_test_outputs, '*', inputs(1,:), inputs(2,:), model.model_outputs, '@', inputs(1,:), inputs(2,:), outputs, '+', model.centers(1,:), model.centers(2,:), 0 * model.centers(1,:) -2, '@')

	ret = model;
	model.model_rms
end
