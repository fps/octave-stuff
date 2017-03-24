function ret = centered_sigmoid_neuron(center, weights, input)
	ret = tanh(weights * (input - center));
end

