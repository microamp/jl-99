#=
P11 (*) Modified run-length encoding.
Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.

Example:
* (encode-modified '(a a a a b c c a a d e e e e))
((4 A) B (2 C) (2 A) D (4 E))
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

function encode_modified(coll)
    packed = pack(coll)
    map(group -> length(group) > 1 ? [length(group), group[1]] : group[1], packed)
end

encoded = encode_modified([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e])
@assert encoded[1] == [4, :a]
@assert encoded[2] == :b
@assert encoded[3] == [2, :c]
@assert encoded[4] == [2, :a]
@assert encoded[5] == :d
@assert encoded[6] == [4, :e]

println("Tests passed: JL-11.jl")
