#=
P07 (**) Flatten a nested list structure.
Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

Example:
* (my-flatten '(a (b (c d) e)))
(A B C D E)

Hint: Use the predefined functions list and append.
=#

function flatten(coll, flattened)
    if isempty(coll)
        flattened
    else
        first, rest = coll[1], coll[2:end]
        if typeof(first) == Symbol
            flatten(rest, vcat(flattened, first))
        else
            vcat(flatten(first, flattened), flatten(rest, []))
        end
    end
end

function my_flatten(coll)
    flatten(coll, [])
end

@assert my_flatten((:a, (:b, (:c, :d), :e))) == [:a, :b, :c, :d, :e]
@assert my_flatten((:a, (:b, (:c,), (:d, :e, :f)), :g)) == [:a, :b, :c, :d, :e, :f, :g]
@assert my_flatten(()) == []

println("Tests passed: JL-07.jl")
