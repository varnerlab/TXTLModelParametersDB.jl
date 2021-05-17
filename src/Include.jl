# setup paths -
function _include_my_codes(path_to_src::String, fileNameArray::Array{String,1})

    try

        for file_name in fileNameArray
            
            path_to_load = joinpath(path_to_src, file_name)
            include(path_to_load)
        end

    catch error
        rethrow(error)
    end

end

# get files from dir -
searchdir(path,key) = filter(x -> contains(x, key), readdir(path))

# setup project paths -
const _PATH_TO_ROOT = pwd()
const _PATH_TO_SRC = joinpath(_PATH_TO_ROOT, "src")
const _PATH_TO_DATABASE = joinpath(_PATH_TO_ROOT, "database")

# load packages -
using DataFrames
using CSV
using SQLite
