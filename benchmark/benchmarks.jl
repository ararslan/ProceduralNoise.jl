using BenchmarkTools
using ProceduralNoise
using Random

on_CI = haskey(ENV, "GITHUB_ACTIONS")

x, y, z = rand(MersenneTwister(1234), Float32, 3)

# Define benchmark
SUITE = BenchmarkGroup()
SUITE["Perlin"] = BenchmarkGroup(["noise", "perlin"])
SUITE["Perlin"]["3D"] = BenchmarkGroup(["3d"])
SUITE["Perlin"]["3D"]["perlin"] = @benchmarkable perlin($x, $y, $z)
SUITE["Perlin"]["3D"]["octaveperlin"] = @benchmarkable octaveperlin($x, $y, $z, $3, $2.0f0)
