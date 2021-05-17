using VLModelParametersDB
using Test

# -- Default test ------------------------------------------------------ #
function default_vlparameterdb_test() 
    return true
end
# ------------------------------------------------------------------------------- #

@testset "default_test_set" begin
    @test default_vlparameterdb_test() == true
end