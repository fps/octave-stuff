function ret = csn_esn_new(number_of_neurons, input_dim, output_dim, spectral_radius)
    ret.input_dim = input_dim;
    ret.output_dim = output_dim;
    ret.spectral_radius = spectral_radius;
    
    ret.number_of_neurons = number_of_neurons;
    ret.centers = randn(ret.number_of_neurons, number_of_neurons);
    
    ret.inner_weights = randn(number_of_neurons, number_of_neurons);
    sr = sort(abs(eig(ret.inner_weights)))(number_of_neurons);
    ret.inner_weights = ret.inner_weights * (spectral_radius / sr);
    
    ret.input_weights = randn(number_of_neurons, input_dim);
end