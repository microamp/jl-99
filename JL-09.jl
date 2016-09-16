#=
P09 (**) Pack consecutive duplicates of list elements into sublists.
If a list contains repeated elements they should be placed in separate sublists.

Example:
* (pack '(a a a a b c c a a d e e e e))
((A A A A) (B) (C C) (A A) (D) (E E E E))
=#

function _pack(coll, current_group, finished_groups)
    if isempty(coll)
        vcat(finished_groups, Vector{}[current_group])
    else
        if coll[1] == current_group[end]
            _pack(coll[2:end], vcat(current_group, coll[1]), finished_groups)
        else
            _pack(coll[2:end], [coll[1]], vcat(finished_groups, Vector{}[current_group]))
        end
    end
end

function pack(coll)
    first, rest = coll[1], coll[2:end]
    _pack(rest, [first], [])
end

packed = pack([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e])
@assert packed[1] == [:a, :a, :a, :a]
@assert packed[2] == [:b]
@assert packed[3] == [:c, :c]
@assert packed[4] == [:a, :a]
@assert packed[5] == [:d]
@assert packed[6] == [:e, :e, :e, :e]

@assert pack([:a]) == Vector{}[[:a]]

println("Tests passed: JL-09.jl")
