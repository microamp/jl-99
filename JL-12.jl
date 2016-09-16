#=
P12 (**) Decode a run-length encoded list.
Given a run-length code list generated as specified in problem P11. Construct its uncompressed version.
=#

function my_repeat(s, num)
    function _my_repeat(s, num, repeated)
        num == 0 ? repeated : _my_repeat(s, num - 1, vcat(repeated, s))
    end
    _my_repeat(s, num, [])
end

function decode(coll)
    pairs = map(item -> typeof(item) == Symbol ? (1, item) : item, coll)
    repeated = map(pair -> my_repeat(pair[2], pair[1]), pairs)
    reduce(vcat, repeated)
end

@assert decode(((4, :a), :b, (2, :c), (2, :a), :d, (4, :e))) == [:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]

println("Tests passed: JL-12.jl")
