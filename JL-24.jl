#=
P24 (*) Lotto: Draw N different random numbers from the set 1..M.
The selected numbers shall be returned in a list.
Example:
* (lotto-select 6 49)
(23 1 17 33 21 37)

Hint: Combine the solutions of problems P22 and P23.
=#

function lotto_select(n, limit)
    [rand(1:limit) for _ in 1:n]
end

selected = lotto_select(6, 49)
@assert length(selected) == 6
@assert all(x -> 1 <= x <= 49, selected)

println("Tests passed: JL-24.jl")
