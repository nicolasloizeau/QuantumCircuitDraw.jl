
using Plots
using QuantumCircuitDraw

N = 5 # number of qubits
steps = 8 # number of steps in the circuit
new_circuit_plot(N, steps; grid=false) #initialize the plot

Single(1, 3, "U")
Single(3, 1, "X")
Controlled(1, 1, 2, "X"; color=:red)
CY(2, 4, 2)
CNOT(3, 4, 5)
QuantumCircuitDraw.default_color = "#ff6f6f"
CCNOT(4, 4, 2, 3)
Swap(5, 1, 5)
MCX(6, [2, 3, 4], 1)
MCZ(7, [5, 3, 4])
Measurement(8, 1)
Measurement(8, 2)
savefig("circuit.png")
savefig("circuit.svg")
