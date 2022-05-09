using ProceduralNoise
using Documenter

DocMeta.setdocmeta!(
    ProceduralNoise, :DocTestSetup, :(using ProceduralNoise); recursive=true
)

makedocs(;
    modules=[ProceduralNoise],
    authors="Adrian Hill <adrian.hill@mailbox.org>",
    repo="https://github.com/adrhill/ProceduralNoise.jl/blob/{commit}{path}#{line}",
    sitename="ProceduralNoise.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://adrhill.github.io/ProceduralNoise.jl",
        assets=String[],
    ),
    pages=["Home" => "index.md"],
)

deploydocs(; repo="github.com/adrhill/ProceduralNoise.jl", devbranch="main")
