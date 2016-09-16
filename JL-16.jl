#=
P16 (**) Drop every N'th element from a list.
Example:
* (drop '(a b c d e f g h i k) 3)
(A B D E G H K)
=#

function my_drop(coll, n)
    function _my_drop(coll, count, temp)
        if isempty(coll)
            temp
        else
            if count == n
                _my_drop(coll[2:end], 1, temp)
            else
                _my_drop(coll[2:end], count + 1, vcat(temp, coll[1]))
            end
        end
    end
    _my_drop(coll, 1, [])
end

@assert my_drop([:a, :b, :c, :d, :e, :f, :g, :h, :i, :k], 3) == [:a, :b, :d, :e, :g, :h, :k]
@assert my_drop([:a, :b, :c, :d, :e], 2) == [:a, :c, :e]
@assert my_drop([:a, :b, :c, :d, :e], 1) == []

println("Tests passed: JL-16.jl")
