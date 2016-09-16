#=
P08 (**) Eliminate consecutive duplicates of list elements.
If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

Example:
* (compress '(a a a a b c c a a d e e e e))
(A B C A D E)
=#

function _compress(coll, compressed)
    if isempty(coll)
        compressed
    else
        compressed = compressed[end] == coll[1] ? compressed : vcat(compressed, coll[1])
        _compress(coll[2:end], compressed)
    end
end

function compress(coll)
    _compress(coll[2:end], [coll[1]])
end

@assert compress([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) == [:a, :b, :c, :a, :d, :e]

println("Tests passed: JL-08.jl")
