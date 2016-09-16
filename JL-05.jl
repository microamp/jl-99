#=
P05 (*) Reverse a list.
=#

function my_reverse(coll)
    # With built-in `reverse` function
    reverse(coll)
end

function reverse_with_reversed(coll, reversed)
    # With tail recursion
    if isempty(coll)
        reversed
    else
        insert!(reversed, 1, coll[1])
        reverse_with_reversed(coll[2:end], reversed)
    end
end

function my_reverse_2(coll)
    # Reversed collection initially empty
    reverse_with_reversed(coll, [])
end

@assert my_reverse([]) == []
@assert my_reverse([:a, :b, :c, :d]) == [:d, :c, :b, :a]
@assert my_reverse(Vector{Symbol}[[:a, :b], [:c, :d]]) == Vector{Symbol}[[:c, :d], [:a, :b]]

@assert my_reverse_2([]) == []
@assert my_reverse_2([:a, :b, :c, :d]) == [:d, :c, :b, :a]
my_reverse_2(Vector{Symbol}[[:a, :b], [:c, :d]])
@assert my_reverse_2(Vector{Symbol}[[:a, :b], [:c, :d]]) == Vector{Symbol}[[:c, :d], [:a, :b]]

println("Tests passed: JL-05.jl")
