#=
P15 (**) Replicate the elements of a list a given number of times.
Example:
* (repli '(a b c) 3)
(A A A B B B C C C)
=#

# From P12
function my_repeat(s, num)
    function _my_repeat(s, num, repeated)
        num == 0 ? repeated : _my_repeat(s, num - 1, vcat(repeated, s))
    end
    _my_repeat(s, num, [])
end

function repli(coll, num)
    reduce(vcat, [], map(item -> my_repeat(item, num), coll))
end

@assert repli([:a, :b, :c], 3) == [:a, :a, :a, :b, :b, :b, :c, :c, :c]
@assert repli([:a], 5) == [:a, :a, :a, :a, :a]
@assert repli([], 1) == []

println("Tests passed: JL-15.jl")
