#=
P18 (**) Extract a slice from a list.
Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included). Start counting the elements with 1.

Example:
* (slice '(a b c d e f g h i k) 3 7)
(C D E F G)
=#

function my_slice(coll, idx1, idx2)
    len = length(coll)
    if idx1 > len
        []
    elseif idx2 > len
        coll[idx1:end]
    else
        coll[idx1:idx2]
    end
end

@assert my_slice([:a, :b, :c, :d, :e, :f, :g, :h, :i, :k], 3, 7) == [:c, :d, :e, :f, :g]
@assert my_slice([:a, :b, :c], 2, 10) == [:b, :c]
@assert my_slice([:a, :b, :c], 5, 10) == []

println("Tests passed: JL-18.jl")
