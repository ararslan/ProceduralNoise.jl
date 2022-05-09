using Test
using ProceduralNoise

@testset "ProceduralNoise.jl" begin
    @testset "Perlin noise" begin
        @info "Testing Perlin noise..."
        include("test_perlin.jl")
    end
end
