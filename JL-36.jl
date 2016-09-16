#=
P36 (**) Determine the prime factors of a given positive integer (2).
Construct a list containing the prime factors and their multiplicity.
Example:
* (prime-factors-mult 315)
((3 2) (5 1) (7 1))
Hint: The problem is similar to problem P13.
=#

SMALLEST_PRIME = 2

# From P35
function next_prime(n)
    # Brute-force incremental check
    isprime(n) ? n : next_prime(n + 1)
end

# From P35
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

# From P35
function prime_factors(n)
    # Starting with the smallest prime, 2
    isprime(n) ? n : _prime_factors(n, SMALLEST_PRIME, [])
end

function _prime_factors_multi(pf, n, count, counters)
    if isempty(pf)
        vcat(counters, Vector{}[[n, count]])
    else
        if pf[1] == n
            _prime_factors_multi(pf[2:end], n, count + 1, counters)
        else
            new_counters = vcat(counters, Vector{}[[n, count]])
            _prime_factors_multi(pf[2:end], pf[1], 1, new_counters)
        end
    end
end

function prime_factors_multi(n)
    pf = prime_factors(n)
    _prime_factors_multi(pf[2:end], pf[1], 1, Vector{}[])
end

@assert prime_factors_multi(315) == Vector{}[[3, 2], [5, 1], [7, 1]]

println("Tests passed: JL-36.jl")
