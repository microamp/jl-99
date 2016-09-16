#=
P26 (**) Generate the combinations of K distinct objects chosen from the N elements of a list
In how many ways can a committee of 3 be chosen from a group of 12 people? We all know that there are C(12,3) = 220 possibilities (C(N,K) denotes the well-known binomial coefficients). For pure mathematicians, this result may be great. But we want to really generate all the possibilities in a list.

Example:
* (combination 3 '(a b c d e f))
((A B C) (A B D) (A B E) ... )
=#


function filter_colls(colls, len)
    filter(coll -> length(coll) == len, colls)
end

function append_indices(indices, last_index)
    next_index = indices[end] + 1
    map(i -> vcat(indices, i), next_index:last_index)
end

function combination(n, coll)
    function _combination(index_list, count)
        if count == n
            index_list
        else
            new_index_list = map(indices -> append_indices(indices, length(coll)), index_list)
            flattened = reduce(vcat, new_index_list)
            _combination(filter_colls(flattened, count + 1), count + 1)
        end
    end

    index_list = _combination(map(idx -> [idx], 1:length(coll)), 1)
    map(indices -> map(i -> coll[i], indices), index_list)
end

coll = [:a, :b, :c, :d, :e, :f]
combos = combination(3, coll)
@assert length(combos) == 20
@assert combos[1] == [:a, :b, :c]
@assert combos[2] == [:a, :b, :d]
@assert combos[3] == [:a, :b, :e]
@assert combos[4] == [:a, :b, :f]
@assert combos[5] == [:a, :c, :d]
@assert combos[6] == [:a, :c, :e]
@assert combos[7] == [:a, :c, :f]
@assert combos[8] == [:a, :d, :e]
@assert combos[9] == [:a, :d, :f]
@assert combos[10] == [:a, :e, :f]
@assert combos[11] == [:b, :c, :d]
@assert combos[12] == [:b, :c, :e]
@assert combos[13] == [:b, :c, :f]
@assert combos[14] == [:b, :d, :e]
@assert combos[15] == [:b, :d, :f]
@assert combos[16] == [:b, :e, :f]
@assert combos[17] == [:c, :d, :e]
@assert combos[18] == [:c, :d, :f]
@assert combos[19] == [:c, :e, :f]
@assert combos[20] == [:d, :e, :f]

println("Tests passed: JL-26.jl")
