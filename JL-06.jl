#=
P06 (*) Find out whether a list is a palindrome.
A palindrome can be read forward or backward; e.g. (x a m a x).
=#

function is_palindrome(coll)
    # With built-in `reverse` function
    coll == reverse(coll)
end

function is_palindrome_2(coll)
    # With tail recursion
    if isempty(coll)
        true
    else
        coll[1] == coll[end] && is_palindrome_2(coll[2:end - 1])
    end
end

@assert is_palindrome((:x, :a, :m, :a, :x))
@assert !is_palindrome((:a, :b, :c, :d, :b, :a))

@assert is_palindrome_2((:x, :a, :m, :a, :x))
@assert !is_palindrome_2((:a, :b, :c, :d, :b, :a))

println("Tests passed: JL-06.jl")
