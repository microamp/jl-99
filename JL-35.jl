#=
P35 (**) Determine the prime factors of a given positive integer.
Construct a flat list containing the prime factors in ascending order.
Example:
* (prime-factors 315)
(3 3 5 7)
=#

SMALLEST_PRIME = 2

function next_prime(n)
    # Brute-force incremental check
    isprime(n) ? n : next_prime(n + 1)
end

function _prime_factors(n, x, pf)
    if isprime(n)
        vcat(pf, n)
    else
        if mod(n, x) == 0
            _prime_factors(div(n, x), SMALLEST_PRIME, vcat(pf, x))
        else
            _prime_factors(n, next_prime(x + 1), pf)
        end
    end
end

function prime_factors(n)
    # Starting with the smallest prime, 2
    isprime(n) ? n : _prime_factors(n, SMALLEST_PRIME, [])
end

@assert prime_factors(315) == [3, 3, 5, 7]
@assert prime_factors(360) == [2, 2, 2, 3, 3, 5]
@assert prime_factors(144) == [2, 2, 2, 2, 3, 3]

println("Tests passed: JL-35.jl")
