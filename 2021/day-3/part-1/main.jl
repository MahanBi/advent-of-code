# Code From https://github.com/DearRude/advent-of-code/blob/main/2021/day-03/part-1.jl
input_file = open("inputs.txt", "r")
binaries = split.(readlines(input_file), " ") .|> x -> x[1]

gamma_bits =
    [count(==('0'), binaries .|> x -> x[idx]) > length(binaries) / 2 ? '0' : '1'
    for (idx, _) ∈ binaries[1] |> enumerate]

pad = 64 - length(gamma_bits)
gamma_rate = parse(UInt, gamma_bits |> join, base=2)
@info gamma_rate * (~gamma_rate << pad >> pad)
