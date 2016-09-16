#=
P25 (*) Generate a random permutation of the elements of a list.
Example:
* (rnd-permu '(a b c d e f))
(B A D C E F)

Hint: Use the solution of problem P23.
=#

function rnd_permu_1(coll)
    # Using built-in `shuffle` function
    shuffle(coll)
end

function rnd_index(coll)
    rand(1:length(coll))
end

function rnd_permu_2(coll)
    selected_indices = []
    while length(selected_indices) < length(coll)
        random_index = rnd_index(coll)
        if !(random_index in selected_indices)
            push!(selected_indices, random_index)
        end
    end
    map(idx -> coll[idx], selected_indices)
end

coll = [:a, :b, :c, :d, :e, :f]
perm1 = rnd_permu_1(coll)
@assert length(unique(perm1)) == length(coll)
@assert all(x -> x in coll, perm1)

perm2 = rnd_permu_2(coll)
@assert length(unique(perm2)) == length(coll)
@assert all(x -> x in coll, perm2)

println("Tests passed: JL-25.jl")
