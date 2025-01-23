module QuantumCircuitDraw


using Plots

export circuit_plot
export Single, CNOT, CCNOT, Measurement, Swap, Controlled
export CX, CY, CZ
export CCX, CCY, CCZ
export MCX, MCZ

include("gates.jl")
include("tools.jl")


linewidth = 3
color = "#6fa5ff"
wbox = 0.7


function draw_qubit_names(N; names=[])
    if isempty(names)
        names = ["q" * subscript(string(i)) for i in 1:N]
    end
    for i in 1:N
        annotate!(0, i, text(names[i], :black, :center))
    end
end


"""
    circuit_plot(N::Int, steps::Int; qubit_names=[], grid=false)

Initializes a plot for a quantum circuit with `N` qubits and `steps` steps.
If `qubit_names` is empty, the qubits are named `q₁`, `q₂`, etc.
Set `grid=true` to show a grid.
"""
function circuit_plot(N::Int, steps::Int; qubit_names=[], grid=false)
    plot(legend=false, aspect_ratio=1,
        grid=grid,
        showaxis=grid,
        ticks=grid,
        yflip=true)
    draw_qubit_names(N; names=qubit_names)
    draw_lines(N, steps)
    plot!(xlim=(-wbox / 2, steps + 1))
end

end
