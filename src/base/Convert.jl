function transform(data_dictionary::Dict{String,Any}, system_flag::String)::DataFrame

    # initialize -
    df = DataFrame(biophysical_parameter_id=String[], parameter_key=String[], 
        parameter_value=String[], parameter_units=String[], parameter_source_reference = Union{String,Missing}[],
        system_key = String[])

    try

        # ok, so lets populate the data from the dictionary -
        for (key, dict_value) in data_dictionary
            
            # build a local array, we'll add stuff to the df row wise -
            local_data_row = Array{Union{String,Missing},1}()

            # build a UUID for this record -
            record_id = string(uuid4())
            push!(local_data_row,record_id)
            push!(local_data_row,key)

            # get the value -
            parameter_value = dict_value["value"]
            push!(local_data_row, parameter_value)

            # get the units -
            parameter_units = dict_value["units"]
            push!(local_data_row, parameter_units)

            # parameter reference -
            parameter_reference = dict_value["bionumbers_reference"]
            push!(local_data_row, parameter_reference)

            # what is the system key -
            push!(local_data_row, system_flag)

            # add to the df -
            push!(df, tuple(local_data_row...))
        end

        # return -
        return df
    catch error
        throw(error)
    end
end