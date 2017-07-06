function ret = csn_esn_evaluate(model, inputs)
    ret = zeros(model.number_of_neurons, columns(inputs) + 1);
    
    for index = 1:columns(inputs)
        index
        for neuron = 1:model.number_of_neurons
            input_activation = model.input_weights(neuron, :) * inputs(:, index);
            ret(neuron, index + 1) = centered_sigmoid_neuron([model.centers(:, neuron); zeros(1, model.input_dim)], [model.input_weights(neuron, :) model.inner_weights(neuron, :)], [ret(:, index); inputs(:, index)]);
        end
    end
end