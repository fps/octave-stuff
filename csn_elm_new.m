# inputs are column vectors of data
# outputs are column vectors of data
# number_of_neurons is an integer
function ret = csn_elm_new(inputs, outputs, number_of_neurons, test_inputs, test_outputs)
	ret.inputs = inputs;
	ret.outputs = outputs;
	ret.test_inputs = test_inputs;
	ret.test_outputs = test_outputs;
	ret.number_of_inputs = columns(inputs);
	ret.number_of_test_inputs = columns(test_inputs);
	ret.number_of_neurons = number_of_neurons;

	ret.input_dim = rows(inputs);
	ret.input_mean = mean(inputs')';
	ret.input_max = max(inputs')';
	ret.input_min = min(inputs')';
	ret.input_range = ret.input_max - ret.input_min;

	ret.output_dim = rows(outputs);

	ret.centers = rand(ret.input_dim, number_of_neurons);
	ret.centers = diag(ret.input_range) * ret.centers;

	for row = 1:ret.input_dim
		ret.centers(row, :) += ret.input_min(row);
	end

	# ret.centers = zeros(ret.input_dim, number_of_neurons);

	# ret.input_weights = 2 * rand(number_of_neurons, ret.input_dim) - 1;
	ret.input_weights = randn(number_of_neurons, ret.input_dim);

	for dim = 1:ret.input_dim
		# ret.input_weights(:, dim) *= 1/(ret.input_range(dim) + 0.0001);
	end

	ret.input_features = zeros(ret.number_of_neurons, ret.number_of_inputs);
	ret.test_input_features = zeros(ret.number_of_neurons, ret.number_of_test_inputs);

	tic
	for input = 1:ret.number_of_inputs
        input
		for neuron = 1:ret.number_of_neurons
			ret.input_features(neuron, input) = centered_sigmoid_neuron(ret.centers(:,neuron), ret.input_weights(neuron,:), ret.inputs(:,input));
		end
	end
	toc

	tic
	for input = 1:ret.number_of_test_inputs
        input
		for neuron = 1:ret.number_of_neurons
			ret.test_input_features(neuron, input) = centered_sigmoid_neuron(ret.centers(:,neuron), ret.input_weights(neuron,:), ret.test_inputs(:,input));
		end
	end
	toc


	ret.input_features = [ ret.input_features ];
    # ret.random_projection = 2 * rand(30, ret.number_of_neurons) - 1;
    # ret.input_features = ret.random_projection * ret.input_features;
	# ret.input_features = [ ret.input_features; ones(1, ret.number_of_inputs) ];

	# ret.output_weights = ret.outputs * pinv(ret.input_features);
    # ret.output_weights = ret.outputs * ret.input_features * inv(ret.input_features * ret.input_features' + diag(ones(1, ret.number_of_neurons)));
    ret.output_weights = (inv(ret.input_features * ret.input_features' + 0.01 * diag(ones(1, ret.number_of_neurons))) * ret.input_features * ret.outputs')';

	ret.model_outputs = ret.output_weights * ret.input_features;
    ret.model_test_outputs = ret.output_weights * ret.test_input_features;

	ret.model_rms = sqrt(sum(mean((ret.model_outputs - outputs).**2')));
	ret.model_test_rms = sqrt(sum(mean((ret.model_test_outputs - test_outputs).**2')));
end

