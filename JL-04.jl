#=
P04 (*) Find the number of elements of a list.
=#

function my_length(coll)
    # With built-in `length` function
    length(coll)
end

function len_with_count(coll, count)
    # With tail recursion
    if isempty(coll)
        count
    else
        len_with_count(coll[2:end], count + 1)
    end
end

function my_length_2(coll)
    # Counting from 0
    len_with_count(coll, 0)
end

@assert my_length(()) == 0
@assert my_length((:a, :b, :c)) == 3
@assert my_length((1, 2, 3, 4)) == 4
@assert my_length(((:a, :b), (:c, :d), (:e, :f))) == 3

@assert my_length_2(()) == 0
@assert my_length_2((:a, :b, :c)) == 3
@assert my_length_2((1, 2, 3, 4)) == 4
@assert my_length_2(((:a, :b), (:c, :d), (:e, :f))) == 3

println("Tests passed: JL-04.jl")
