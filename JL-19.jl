#=
P19 (**) Rotate a list N places to the left.
Examples:
* (rotate '(a b c d e f g h) 3)
(D E F G H A B C)

* (rotate '(a b c d e f g h) -2)
(G H A B C D E F)

Hint: Use the predefined functions length and append, as well as the result of problem P17.
=#

function rotate(coll, n)
    if n > 0
        vcat(coll[n + 1:end], coll[1:n])
    else
        vcat(coll[end + n + 1:end], coll[1:end + n])
    end
end

@assert rotate([:a, :b, :c, :d, :e, :f, :g, :h], 3) == [:d, :e, :f, :g, :h, :a, :b, :c]
@assert rotate([:a, :b, :c, :d, :e, :f, :g, :h], -2) == [:g, :h, :a, :b, :c, :d, :e, :f]
@assert rotate([:a, :b, :c], 0) == [:a, :b, :c]

println("Tests passed: JL-19.jl")
