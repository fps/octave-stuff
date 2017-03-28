function ret = cln_eml_evaluate(model, inputs)
    for input = 1:ret.number_of_inputs
        for neuron = 1:ret.number_of_neurons
            ret.input_features(neuron, input) = centered_sigmoid_neuron(ret.centers(:,neuron), ret.input_weights(neuron,:), ret.inputs(:,input));
        end
    end
end
