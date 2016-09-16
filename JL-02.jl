#=
P02 (*) Find the last but one box of a list.
Example:
* (my-but-last '(a b c d))
(C D)
=#

function my_but_last(coll)
    coll[end - 1:end]
end

@assert my_but_last((:a, :b, :c, :d)) == (:c, :d)
@assert my_but_last((1, 2, 3)) == (2, 3)
@assert my_but_last(((:a, :b), (:c, :d), (:e, :f))) == ((:c, :d), (:e, :f))

println("Tests passed: JL-02.jl")
