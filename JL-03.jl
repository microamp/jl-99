#=
P03 (*) Find the K'th element of a list.
The first element in the list is number 1.
Example:
* (element-at '(a b c d e) 3)
C
=#

function element_at(coll, index)
    # With built-in index literal
    coll[index]
end

function element_at_2(coll, current)
    # With tail recursion
    if current == 1
        coll[current]
    else
        element_at_2(coll[2:end], current - 1)
    end
end

@assert element_at((:a, :b, :c, :d, :e), 3) == :c
@assert element_at((1, 2, 3), 3) == 3
@assert element_at(((:a, :b), (:c, :d)), 2) == (:c, :d)

@assert element_at_2((:a, :b, :c, :d, :e), 3) == :c
@assert element_at_2((1, 2, 3), 3) == 3
@assert element_at_2(((:a, :b), (:c, :d)), 2) == (:c, :d)

println("Tests passed: JL-03.jl")
