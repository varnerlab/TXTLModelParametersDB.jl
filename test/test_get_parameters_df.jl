using VLModelParametersDB

# execute -
biophysical_dictionary = get_biophysical_parameters_dictionary_for_system(:CF_TXTL)

# get information -
key = "transcription_elongation_rate"
parameter_value = value(key, )