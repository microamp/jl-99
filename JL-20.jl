#=
P20 (*) Remove the K'th element from a list.
Example:
* (remove-at '(a b c d) 2)
(A C D)
=#

function remove_at(coll, n)
    n > length(coll) ? coll : vcat(coll[1:n - 1], coll[n + 1:end])
end

@assert remove_at([:a, :b, :c, :d], 2) == [:a, :c, :d]
@assert remove_at([:a, :b], 1) == [:b]
@assert remove_at([:a, :b, :c], 5) == [:a, :b, :c]

println("Tests passed: JL-20.jl")
