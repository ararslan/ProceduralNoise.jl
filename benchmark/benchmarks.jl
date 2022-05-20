using BenchmarkTools
using ProceduralNoise
using Random

on_CI = haskey(ENV, "GITHUB_ACTIONS")

x, y, z = rand(MersenneTwister(1234), Float32, 3)

# Define benchmark
SUITE = BenchmarkGroup()
SUITE["perlin 3D"] = @benchmarkable perlin($x, $y, $z)
SUITE["octaveperlin 3D"] = @benchmarkable octaveperlin($x, $y, $z, $3, $2.0f0)
