clamp01(x) = clamp(x, zero(x), oneunit(x))

fade(x) = 6x^5 - 15x^4 + 10x^3

"""
    lerp(a0, a1, x)

Linear interpolation between `a0` and `a1` assuming `x ∈ [0, 1]`.
"""
lerp(a0::T, a1::T, x::T) where {T} = a0 + x * (a1 - a0) # linear interpolation using x ∈ [0, 1]

"""
    rescale(a0, a1, x)

Rescale and clamp. Returns `0` for `x ≤ a0`, `1` for `x ≥ a1` and linear interpolation
between `a0` and `a1` otherwise.
"""
rescale(a0::T, a1::T, x::T) where {T} = clamp01((x - a0) / (a1 - a0))

function smoothstep(a0::T, a1::T, x::T) where {T<:AbstractFloat}
    a0 != a1 || throw(ArgumentError("Arguments a0 and a1 cannot be equal"))
    x = rescale(a0, a1, x)
    return 3x^2 - 2x^3
end

function smootherstep(a0::T, a1::T, x::T) where {T<:AbstractFloat}
    a0 != a1 || throw(ArgumentError("Arguments a0 and a1 cannot be equal"))
    x = rescale(a0, a1, x)
    return fade(x)
end

# Might refactor this down to a simple lerp
function interpolate(a0::T, a1::T, w::T, method::Symbol=:linear) where {T<:AbstractFloat}
    0 ≤ w ≤ 1 || throw(ArgumentError("Expected 0 ≤ w ≤ 1, got $w"))
    x = if method == :linear
        w
    elseif method == :smoothstep
        smoothstep(a0, a1, w)
    elseif method == :smootherstep
        smootherstep(a0, a1, w)
    else
        throw(ArgumentError("Unrecognized interpolation method $method"))
    end
    return lerp(a0, a1, x)
end
