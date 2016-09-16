#=
P32 (**) Determine the greatest common divisor of two positive integer numbers.
Use Euclid's algorithm.
Example:
* (gcd 36 63)
9
=#

function gcd(a, b)
    if b == 0
        a
    else
        gcd(b, mod(a, b))
    end
end

@assert gcd(36, 63) == 9
@assert gcd(108, 30) == 6
@assert gcd(32, 5) == 1

println("Tests passed: JL-32.jl")
