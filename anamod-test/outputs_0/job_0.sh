#!/bin/sh
mkdir outputs_0
tar -xzf python38.tar.gz
export PATH=${PWD}/python/bin/:${PATH}
export PYTHONPATH=${PWD}/packages
export LC_ALL=en_US.UTF-8
python3 -m pip install --upgrade pip
python3 -m pip install git+https://github.com/cloudbopper/anamod --target ${PWD}/packages
python3 -m anamod.core.worker -worker_idx 0 -analysis_type temporal -perturbation permutation -num_permutations 50 -permutation_test_statistic mean_loss -loss_function binary_cross_entropy -importance_significance_level 0.1 -window_search_algorithm effect_size -window_effect_size_threshold 0.01 -output_dir outputs_0 -features_filename input_features_worker_0.cpkl -model_filename model.cpkl -model_loader_filename model_loader.py -data_filename data.hdf5
