using VLModelParametersDB

# execute -
biophysical_dictionary = get_biophysical_parameters_dictionary_for_system(:HUMAN)

# get information -
key = :half_life_translation_capacity
parameter_value = value(biophysical_dictionary, key)
parameter_units = units(biophysical_dictionary, key)
parameter_reference = reference(biophysical_dictionary, key)