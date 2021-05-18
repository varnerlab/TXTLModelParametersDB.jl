![CI](https://github.com/varnerlab/CellFreeModelGenerationKit.jl/workflows/CI/badge.svg)

## Introduction 
`VLModelParametersDB.jl` is a a [Julia](https://julialang.org) package that wraps a [SQLite](https://github.com/JuliaDatabases/SQLite.jl) database holding transcription (TX) and translation (TL) parameters (taken from [BioNumbers](https://bionumbers.hms.harvard.edu/search.aspx) and other sources), and
enzyme kinetic information taken from the [BRENDA](https://www.brenda-enzymes.org) enzyme database.

### Installation
`VLModelParametersDB.jl` can be installed using the [Julia package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/). From the [Julia REPL](https://docs.julialang.org/en/v1/stdlib/REPL/) enter package mode by pressing the ']' key and then issue the command:

    (@v1.6) pkg> add VLModelParametersDB

`VLModelParametersDB.jl` can be used stand-alone, or as part of models generated using one of our various model code generators e.g., [JUGRN](https://github.com/varnerlab/JUGRN.jl).

### Funding
The work described was supported by the [Center on the Physics of Cancer Metabolism at Cornell University](https://psoc.engineering.cornell.edu) through Award Number 1U54CA210184-01 from the [National Cancer Institute](https://www.cancer.gov). The content is solely the responsibility of the authors and does not necessarily
represent the official views of the [National Cancer Institute](https://www.cancer.gov) or the [National Institutes of Health](https://www.nih.gov).

