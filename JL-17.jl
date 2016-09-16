#=
P17 (*) Split a list into two parts; the length of the first part is given.
Do not use any predefined predicates.

Example:
* (split '(a b c d e f g h i k) 3)
( (A B C) (D E F G H I K))
=#

function my_split(coll, index)
    vcat(Vector{}[coll[1:index]], Vector{}[coll[index + 1:end]])
end

splitted = my_split([:a, :b, :c, :d, :e, :f, :g, :h, :i, :k], 3)
@assert splitted[1] == [:a, :b, :c]
@assert splitted[2] == [:d, :e, :f, :g, :h, :i, :k]

println("Tests passed: JL-17.jl")
