#=
P01 (*) Find the last box of a list.
Example:
* (my-last '(a b c d))
(D)
=#

function my_last(coll)
    coll[end:end]
end

@assert my_last((:a, :b, :c, :d)) == (:d,)
@assert my_last((1, 2, 3)) == (3,)
@assert my_last(((:a, :b), (:c, :d))) == ((:c, :d),)

println("Tests passed: JL-01.jl")
