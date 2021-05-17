function get_biophysical_parameters_for_system(db::SQLite.DB, system_type::Symbol)::DataFrame

    try

        # ok, write a SELECT statement to all the parameters for this system type -
        system_type_string = String(system_type)
        sql_string = "SELECT * FROM BIOPHYSICAL_PARAMETERS_TABLE WHERE system_key=\"$(system_type_string)\""

        # execute the call -
        query_result = DBInterface.execute(db, sql_string)

        # turn the result into a table (and return for now so we can see what gets returned)
        df = DataFrame(query_result)

        # do some checks on the df?
        # ...

        return df
    catch error
        throw(error)
    end
end