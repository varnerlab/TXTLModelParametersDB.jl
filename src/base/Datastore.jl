function get_biophysical_parameters_table_for_system(system_type::String)::DataFrame
    return get_biophysical_parameters_for_system(Symbol(system_type))
end

function get_biophysical_parameters_table_for_system(system_type::Symbol)::DataFrame

    try

        # open a connection to the db -
        db = SQLite.DB(path_to_database_file)

        # ok, write a SELECT statement to all the parameters for this system type -
        system_type_string = String(system_type)
        sql_string = "SELECT * FROM BIOPHYSICAL_PARAMETERS_TABLE WHERE system_key=\"$(system_type_string)\";"

        # execute the call -
        query_result = DBInterface.execute(db, sql_string)

        # turn the result into a df table -
        df = DataFrame(query_result)

        # return -
        return df
    catch error
        rethrow(error)
    end
end

function get_biophysical_parameters_dictionary_for_system(system_type::String)::Dict{String,NamedTuple}
    return get_biophysical_parameters_dictionary_for_system(Symbol(system_type)) 
end

function get_biophysical_parameters_dictionary_for_system(system_type::Symbol)::Dict{String,NamedTuple}

    # initialize -
    parameter_dictionary = Dict{String,NamedTuple}()

    try

        # get the parameter table -
        df = get_biophysical_parameters_table_for_system(system_type)

        # convert - use the parameter_key as the dictionary key -
        (number_of_records, _) = size(df)
        for record_index = 1:number_of_records
            
            # get key -
            parameter_key = df[record_index, :parameter_key]
            parameter_id_value = df[record_index, :biophysical_parameter_id]
            parameter_value_value = df[record_index, :parameter_value]
            parameter_units_value = df[record_index, :parameter_units]
            parameter_source_reference_value = df[record_index, :parameter_source_reference]
            system_key_value = df[record_index, :system_key]

            # build named tuple -
            record_tuple = (parameter_id = parameter_id_value, parameter_value = parameter_value_value, 
                parameter_units = parameter_units_value, parameter_source_reference = parameter_source_reference_value,
                system_key = system_key_value)

            # add to dictionaey -
            parameter_dictionary[parameter_key] =  record_tuple
        end

        # return -
        return parameter_dictionary
    catch error
        rethrow(error)
    end
end

function value(parameter_dictionary::Dict{String,NamedTuple},
    key::String)::Union{String, Float64, Int64, Missing, Nothing}


    try

        # get the record tuple -
        record_tuple = parameter_dictionary[key]
        value = record_tuple.parameter_value

        # cast -
        if (tryparse(Float64, value) !== nothing)
            return parse(Float64, value)
        else
            return value
        end
        
    catch error
        rethrow(error)
    end
end

function units(parameter_dictionary::Dict{String,NamedTuple},
    key::String)::Union{String, Float64, Int64, Missing, Nothing}

    try
        
        # get the record tuple -
        record_tuple = parameter_dictionary[key]
        value = record_tuple.parameter_units

        # return -
        return value

    catch error
        rethrow(error)
    end
end

function reference(parameter_dictionary::Dict{String,NamedTuple},
    key::String)::Union{String, Float64, Int64, Missing, Nothing}

    try

        # get the record tuple -
        record_tuple = parameter_dictionary[key]
        value = record_tuple.parameter_source_reference

        # check: isempty -
        if (isempty(value) == true)
            return nothing
        else
            return value
        end

    catch error
        rethrow(error)
    end
end


