using VLModelParametersDB

# execute -
biophysical_dictionary = get_biophysical_parameters_dictionary_for_system(:CF_TXTL)

# get information -
key = "characteristic_initiation_time_translation"
parameter_value = value(biophysical_dictionary, key)
parameter_units = units(biophysical_dictionary, key)
parameter_reference = reference(biophysical_dictionary, key)