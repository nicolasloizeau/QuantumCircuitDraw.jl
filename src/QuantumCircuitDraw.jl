module QuantumCircuitDraw


using Plots

export new_circuit_plot, paulistrings_plot, circuit_plot
export Single, CNOT, CCNOT, Measurement, Swap, Controlled
export X, Y, Z, H, S, T, Tdg, Phase
export CX, CY, CZ
export CCX, CCY, CCZ
export MCX, MCZ
export default_color
export set_default_color

include("gates.jl")
include("tools.jl")


linewidth = 3
default_color = "#6fa5ff"
wbox = 0.7

function set_default_color(color)
    global default_color = color
end

function draw_qubit_names(N; names=[])
    if isempty(names)
        names = ["q" * subscript(string(i)) for i in 1:N]
    end
    for i in 1:N
        annotate!(0, i, text(names[i], :black, :center))
    end
end


"""
    new_circuit_plot(N::Int, steps::Int; qubit_names=[], grid=false, dpi=300)

Initializes a plot for a quantum circuit with `N` qubits and `steps` steps.
If `qubit_names` is empty, the qubits are named `q₁`, `q₂`, etc.
Set `grid=true` to show a grid.
"""
function new_circuit_plot(N::Int, steps::Int; qubit_names=[], grid=false, dpi=300)
    plot(legend=false, aspect_ratio=1,
        grid=grid,
        showaxis=grid,
        ticks=grid,
        yflip=true,
        size=((steps + 1) * 60, (N + 1) * 60),
        dpi=dpi)
    draw_qubit_names(N; names=qubit_names)
    draw_lines(N, steps)
    plot!(xlim=(-wbox / 2, steps + 1))
end

"""
    circuit_plot(N::Int, circuit::Vector{Tuple{String, Vector{Real}}}; qubit_names=[], grid=false, dpi=300)

Plots a circuit of the form `circuit = [(gate, sites), ...]`.
"""
function circuit_plot(N::Int, circuit::Vector{Tuple{String, Vector{Real}}}; qubit_names=[], grid=false, dpi=300)
    stack = zeros(Int, N)
    c = []
    for (gate, sites) in circuit
        sites2 = minimum(sites):maximum(sites)
        i = maximum(stack[sites2]) + 1
        stack[sites2] .= i
        push!(c, (gate, i, sites))
    end
    new_circuit_plot(N, maximum(stack); qubit_names=qubit_names, grid=grid, dpi=dpi)
    for (gate, i, sites) in c
        eval(Symbol(gate))(i, sites...)
    end
end

"""
    paulistrings_plot(circuit; qubit_names=[], grid=false, dpi=300)

Plots a circuit constructed with PauliStrings.jl
"""
function paulistrings_plot(circuit; qubit_names=[], grid=false, dpi=300)
    c = Vector{Tuple{String, Vector{Real}}}()
    for (gate, sites) in circuit.gates
        if gate == "Noise"
            continue
        else
            push!(c, (gate, sites))
        end
    end
    circuit_plot(circuit.N, c; qubit_names=qubit_names, grid=grid, dpi=dpi)
end


end
