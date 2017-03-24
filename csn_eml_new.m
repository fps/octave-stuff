# inputs are column vectors of data
# outputs are column vectors of data
# number_of_neurons is an integer
function ret = csn_eml_new(inputs, outputs, number_of_neurons)
	ret.inputs = inputs;
	ret.outputs = outputs;
	ret.number_of_inputs = columns(inputs);
	ret.number_of_neurons = number_of_neurons;

	ret.input_dim = rows(inputs);
	ret.input_mean = mean(inputs')';
	ret.input_max = max(inputs')';
	ret.input_min = min(inputs')';
	ret.input_range = ret.input_max - ret.input_min;

	ret.output_dim = rows(outputs);

	ret.centers = center(rand(ret.input_dim, number_of_neurons));
	ret.centers = diag(ret.input_range) * ret.centers;

	for row = 1:ret.input_dim
		ret.centers(row, :) += ret.input_min(row);
	end

	ret.input_weights = randn(number_of_neurons, ret.input_dim);

	ret.input_features = zeros(ret.number_of_neurons, ret.number_of_inputs);

	for input = 1:ret.number_of_inputs
		for neuron = 1:ret.number_of_neurons
			ret.input_features(neuron, input) = centered_sigmoid_neuron(ret.centers(:,neuron), ret.input_weights(neuron,:), ret.inputs(:,input));
		end
	end

	ret.output_weights = ret.outputs * pinv(ret.input_features);

	ret.model_outputs = ret.output_weights * ret.input_features;
end

