#=
P21 (*) Insert an element at a given position into a list.
Example:
* (insert-at 'alfa '(a b c d) 2)
(A ALFA B C D)
=#

function insert_at(item, coll, index)
    vcat(coll[1:index - 1], [item], coll[index:end])
end

@assert insert_at(:alfa, [:a, :b, :c, :d], 2) == [:a, :alfa, :b, :c, :d]
@assert insert_at(0, [1, 2, 3], 1) == [0, 1, 2, 3]

println("Tests passed: JL-21.jl")
