#=
P10 (*) Run-length encoding of a list.
Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.

Example:
* (encode '(a a a a b c c a a d e e e e))
((4 A) (1 B) (2 C) (2 A) (1 D)(4 E))
=#

# From P09
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

# From P09
function pack(coll)
    first, rest = coll[1], coll[2:end]
    _pack(rest, [first], [])
end

function encode(coll)
    packed = pack(coll)
    map(group -> [length(group), group[1]], packed)
end

encoded = encode([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e])
@assert encoded[1] == [4, :a]
@assert encoded[2] == [1, :b]
@assert encoded[3] == [2, :c]
@assert encoded[4] == [2, :a]
@assert encoded[5] == [1, :d]
@assert encoded[6] == [4, :e]

println("Tests passed: JL-10.jl")
