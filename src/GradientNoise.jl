__precompile__()

module GradientNoise

    include("perlin.jl")
    include("opensimplex.jl")

    export perlin,
        octaveperlin
        smoothstep,
        smootherstep
end
