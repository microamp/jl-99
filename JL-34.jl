#=
P34 (**) Calculate Euler's totient function phi(m).
Euler's so-called totient function phi(m) is defined as the number of positive integers r (1 <= r < m) that are coprime to m.
Example: m = 10: r = 1,3,7,9; thus phi(m) = 4. Note the special case: phi(1) = 1.

* (totient-phi 10)
4

Find out what the value of phi(m) is if m is a prime number. Euler's totient function plays an important role in one of the most widely used public key cryptography methods (RSA). In this exercise you should use the most primitive method to calculate this function (there are smarter ways that we shall discuss later).
=#

# From P32 but more terse
function gcd(a, b)
    b == 0 ? a : gcd(b, mod(a, b))
end

# From P33
function coprime(a, b)
    gcd(a, b) == 1
end

function totient_phi(m)
    # Starting at 2, not 1 (special case)
    coprime_to_m = filter(r -> coprime(r, m), 2:m)
    length(coprime_to_m) + 1
end

@assert totient_phi(10) == 4

println("Tests passed: JL-34.jl")
