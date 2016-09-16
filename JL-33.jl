#=
P33 (*) Determine whether two positive integer numbers are coprime.
Two numbers are coprime if their greatest common divisor equals 1.
Example:
* (coprime 35 64)
T
=#

# From P32 but more terse
function gcd(a, b)
    b == 0 ? a : gcd(b, mod(a, b))
end

function coprime(a, b)
    gcd(a, b) == 1
end

@assert coprime(35, 64)
@assert coprime(4, 9)

println("Tests passed: JL-33.jl")
