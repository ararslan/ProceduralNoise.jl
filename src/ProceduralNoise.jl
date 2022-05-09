module ProceduralNoise

include("interpolation.jl")
include("perlin.jl")

export smoothstep, smootherstep
export perlin, octaveperlin
end # module
