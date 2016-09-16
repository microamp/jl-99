#=
P14 (*) Duplicate the elements of a list.
Example:
* (dupli '(a b c c d))
(A A B B C C C C D D)
=#

function dupli(coll)
    vcat(coll, coll)
end

@assert dupli([:a, :b, :c, :c, :d]) == [:a, :b, :c, :c, :d, :a, :b, :c, :c, :d]
@assert dupli([:a]) == [:a, :a]
@assert dupli([]) == []

println("Tests passed: JL-14.jl")
