
# test support for quantum circuit packages

using Plots
using QuantumCircuitDraw
using PauliStrings
using PauliStrings.Circuits

function noisy_toffoli()
    c = Circuit(3)
    push!(c, "H", 3)
    push!(c, "CNOT", 2, 3)
    push!(c, "Noise")
    push!(c, "Tdg", 3)
    push!(c, "CNOT", 1, 3)
    push!(c, "Noise")
    push!(c, "T", 3)
    push!(c, "CNOT", 2, 3)
    push!(c, "Noise")
    push!(c, "Tdg", 3)
    push!(c, "CNOT", 1, 3)
    push!(c, "Noise")
    push!(c, "T", 2)
    push!(c, "T", 3)
    push!(c, "CNOT", 1, 2)
    push!(c, "Noise")
    push!(c, "H", 3)
    push!(c, "T", 1)
    push!(c, "Tdg", 2)
    push!(c, "CNOT", 1, 2)
    push!(c, "Noise")
    return c
end


c = noisy_toffoli()
paulistrings_plot(c)
savefig("ps_toffoli.png")
