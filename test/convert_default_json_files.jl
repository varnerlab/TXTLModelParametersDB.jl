using VLModelParametersDB
using JSON
using CSV

# load the default JSON file -
path_to_json_file = "/Users/jeffreyvarner/Desktop/julia_work/VLModelParametersDB.jl/database/data/default_cell_free_mytxtl.json"
biophysical_json_dict = JSON.parsefile(path_to_json_file)["biophysical_constants"]

# convert -
df = transform(biophysical_json_dict, "CF_TXTL")

# write -
path_to_csv_file = "/Users/jeffreyvarner/Desktop/julia_work/VLModelParametersDB.jl/database/data/mytxtl.csv"
CSV.write(path_to_csv_file, df)