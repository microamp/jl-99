#=
P22 (*) Create a list containing all integers within a given range.
If first argument is smaller than second, produce a list in decreasing order.
Example:
* (range 4 9)
(4 5 6 7 8 9)
=#

function my_range(start, stop)
    function _my_range(start, coll)
        start > stop ? coll : _my_range(start + 1, vcat(coll, start))
    end
    _my_range(start, [])
end

@assert my_range(4, 9) == [4, 5, 6, 7, 8, 9]
@assert my_range(10, 10) == [10]

println("Tests passed: JL-22.jl")
