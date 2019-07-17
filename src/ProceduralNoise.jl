__precompile__()

module ProceduralNoise

    include("perlin.jl")
    include("opensimplex.jl")

    export perlin,
        octaveperlin
        smoothstep,
        smootherstep
end
