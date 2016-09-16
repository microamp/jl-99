#=
P13 (**) Run-length encoding of a list (direct solution).
Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem P09, but only count them. As in problem P11, simplify the result list by replacing the singleton lists (1 X) by X.

Example:
* (encode-direct '(a a a a b c c a a d e e e e))
((4 A) B (2 C) (2 A) D (4 E))
=#

function _encode_direct(coll, current_pair, pairs)
    if isempty(coll)
        vcat(pairs, Vector{}[current_pair])
    else
        count, item = current_pair
        if coll[1] == item
            _encode_direct(coll[2:end], [count + 1, item], pairs)
        else
            _encode_direct(coll[2:end], [1, coll[1]], vcat(pairs, Vector{}[current_pair]))
        end
    end
end

function encode_direct(coll)
    encoded = isempty(coll) ? coll : _encode_direct(coll[2:end], [1, coll[1]], [])
    map(pair -> pair[1] == 1 ? pair[2] : pair, encoded)
end

encoded = encode_direct([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e])
@assert encoded[1] == [4, :a]
@assert encoded[2] == :b
@assert encoded[3] == [2, :c]
@assert encoded[4] == [2, :a]
@assert encoded[5] == :d
@assert encoded[6] == [4, :e]

@assert encode_direct([]) == []

println("Tests passed: JL-13.jl")
