using VLModelParametersDB
using JSON
using CSV

# load the default JSON file -
path_to_json_file = "/Users/jeffreyvarner/Desktop/julia_work/VLModelParametersDB.jl/src/database/data/default_bacteria.json"
biophysical_json_dict = JSON.parsefile(path_to_json_file)["biophysical_constants"]

# convert -
df = transform(biophysical_json_dict, "CF_BACTERIA")

# write -
path_to_csv_file = "/Users/jeffreyvarner/Desktop/julia_work/VLModelParametersDB.jl/src/database/data/bacteria.csv"
CSV.write(path_to_csv_file, df)