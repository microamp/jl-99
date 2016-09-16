#=
P23 (**) Extract a given number of randomly selected elements from a list.
The selected items shall be returned in a list.
Example:
* (rnd-select '(a b c d e f g h) 3)
(E D A)

Hint: Use the built-in random number generator and the result of problem P20.
=#

function rnd_select(coll, n)
    [coll[rand(1:length(coll))] for _ in 1:n]
end

coll = [:a, :b, :c, :d, :e, :f, :g, :h]
rnd_selected = rnd_select(coll, 3)
@assert length(rnd_selected) == 3
@assert all(x -> x in coll, rnd_selected)

println("Tests passed: JL-23.jl")
