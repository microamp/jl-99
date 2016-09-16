#=
P31 (**) Determine whether a given integer number is prime.
Example:
* (is-prime 7)
T
=#

function is_prime(n)
    # Using built-in `isprime` function :)
    isprime(n)
end

@assert is_prime(2)
@assert is_prime(3)
@assert is_prime(5)
@assert is_prime(7)
@assert is_prime(11)
@assert is_prime(999983)  # Biggest prime number under 1,000,000

println("Tests passed: JL-31.jl")
