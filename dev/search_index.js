var documenterSearchIndex = {"docs":
[{"location":"","page":"QuantumCircuitDraw","title":"QuantumCircuitDraw","text":"using Plots; gr()\nPlots.reset_defaults()","category":"page"},{"location":"#QuantumCircuitDraw","page":"QuantumCircuitDraw","title":"QuantumCircuitDraw","text":"","category":"section"},{"location":"","page":"QuantumCircuitDraw","title":"QuantumCircuitDraw","text":"(Image: Build Status) (Image: )","category":"page"},{"location":"","page":"QuantumCircuitDraw","title":"QuantumCircuitDraw","text":"Plot quantum circuits in Qiskit style.","category":"page"},{"location":"#Installation","page":"QuantumCircuitDraw","title":"Installation","text":"","category":"section"},{"location":"","page":"QuantumCircuitDraw","title":"QuantumCircuitDraw","text":"] add https://github.com/nicolasloizeau/QuantumCircuitDraw.jl.git","category":"page"},{"location":"#Example","page":"QuantumCircuitDraw","title":"Example","text":"","category":"section"},{"location":"","page":"QuantumCircuitDraw","title":"QuantumCircuitDraw","text":"using Plots\nusing QuantumCircuitDraw\n\nN = 5 # number of qubits\nsteps = 8 # number of steps in the circuit\nnew_circuit_plot(N, steps; grid=false) #initialize the plot\n\nSingle(1, 3, \"U\")\nSingle(3, 1, \"X\")\nControlled(1, 1, 2, \"X\")\nCY(2, 4, 2)\nCNOT(3, 4, 5)\nCCNOT(4, 4, 2, 3)\nSwap(5, 1, 5)\nMCX(6, [2, 3, 4], 1)\nMCZ(7, [5, 3, 4])\nMeasurement(8, 1)\nMeasurement(8, 2)","category":"page"},{"location":"docstrings/","page":"Docstrings","title":"Docstrings","text":"new_circuit_plot(N::Int, steps::Int; qubit_names=[], grid=false, dpi=300)","category":"page"},{"location":"docstrings/#QuantumCircuitDraw.new_circuit_plot-Tuple{Int64, Int64}","page":"Docstrings","title":"QuantumCircuitDraw.new_circuit_plot","text":"new_circuit_plot(N::Int, steps::Int; qubit_names=[], grid=false, dpi=300)\n\nInitializes a plot for a quantum circuit with N qubits and steps steps. If qubit_names is empty, the qubits are named q₁, q₂, etc. Set grid=true to show a grid.\n\n\n\n\n\n","category":"method"},{"location":"docstrings/","page":"Docstrings","title":"Docstrings","text":"Single(i::Int, j::Int, name::String)","category":"page"},{"location":"docstrings/#QuantumCircuitDraw.Single-Tuple{Int64, Int64, String}","page":"Docstrings","title":"QuantumCircuitDraw.Single","text":"Single(i::Int, j::Int, name::String)\n\nDraws a single-qubit gate at step i and qubit j with name name.\n\n\n\n\n\n","category":"method"},{"location":"docstrings/","page":"Docstrings","title":"Docstrings","text":"Controlled(i::Int, control::Int, target::Int, name::String)","category":"page"},{"location":"docstrings/#QuantumCircuitDraw.Controlled-Tuple{Int64, Int64, Int64, String}","page":"Docstrings","title":"QuantumCircuitDraw.Controlled","text":"Controlled(i::Int, control::Int, target::Int, name::String)\n\nDraws a controlled gate with control qubit and target qubit at step i.\n\n\n\n\n\n","category":"method"},{"location":"docstrings/","page":"Docstrings","title":"Docstrings","text":"MCZ(i::Int, sites::Vector{Int})","category":"page"},{"location":"docstrings/#QuantumCircuitDraw.MCZ-Tuple{Int64, Vector{Int64}}","page":"Docstrings","title":"QuantumCircuitDraw.MCZ","text":"MCZ(i::Int, sites::Vector{Int})\n\nDraws a multi-controlled Z gate acting on sites qubits at step i.\n\n\n\n\n\n","category":"method"},{"location":"docstrings/","page":"Docstrings","title":"Docstrings","text":"MCX(i::Int, controls::Vector{Int}, target::Int)","category":"page"},{"location":"docstrings/#QuantumCircuitDraw.MCX-Tuple{Int64, Vector{Int64}, Int64}","page":"Docstrings","title":"QuantumCircuitDraw.MCX","text":"MCX(i::Int, controls::Vector{Int}, target::Int)\n\nDraws a multi-controlled X gate acting on sites qubits at step i.\n\n\n\n\n\n","category":"method"},{"location":"docstrings/","page":"Docstrings","title":"Docstrings","text":"CNOT(i::Int, control::Int, target::Int)","category":"page"},{"location":"docstrings/#QuantumCircuitDraw.CNOT-Tuple{Int64, Int64, Int64}","page":"Docstrings","title":"QuantumCircuitDraw.CNOT","text":"CNOT(i::Int, control::Int, target::Int)\n\nDraws a CNOT gate at step i with control and target qubits.\n\n\n\n\n\n","category":"method"},{"location":"docstrings/","page":"Docstrings","title":"Docstrings","text":"CCNOT(i::Int, control1::Int, control2::Int, target::Int)","category":"page"},{"location":"docstrings/#QuantumCircuitDraw.CCNOT-NTuple{4, Int64}","page":"Docstrings","title":"QuantumCircuitDraw.CCNOT","text":"CCNOT(i::Int, control1::Int, control2::Int, target::Int)\n\nDraws a CCNOT gate at step i with control1, control2, and target qubits.\n\n\n\n\n\n","category":"method"},{"location":"docstrings/","page":"Docstrings","title":"Docstrings","text":"CCX(i::Int, control1::Int, control2::Int, target::Int)","category":"page"},{"location":"docstrings/#QuantumCircuitDraw.CCX-NTuple{4, Int64}","page":"Docstrings","title":"QuantumCircuitDraw.CCX","text":"CCX(i::Int, control1::Int, control2::Int, target::Int)\n\nSame as CCNOT.\n\n\n\n\n\n","category":"method"},{"location":"docstrings/","page":"Docstrings","title":"Docstrings","text":"Swap(i::Int, j1::Int, j2::Int)","category":"page"},{"location":"docstrings/#QuantumCircuitDraw.Swap-Tuple{Int64, Int64, Int64}","page":"Docstrings","title":"QuantumCircuitDraw.Swap","text":"Swap(i::Int, j1::Int, j2::Int)\n\nDraws a SWAP gate at step i between qubits j1 and j2.\n\n\n\n\n\n","category":"method"},{"location":"docstrings/","page":"Docstrings","title":"Docstrings","text":"Measurement(i::Int, j::Int)","category":"page"},{"location":"docstrings/#QuantumCircuitDraw.Measurement-Tuple{Int64, Int64}","page":"Docstrings","title":"QuantumCircuitDraw.Measurement","text":"Measurement(i::Int, j::Int)\n\nDraws a measurement gate at step i on qubit j.\n\n\n\n\n\n","category":"method"},{"location":"docstrings/","page":"Docstrings","title":"Docstrings","text":"CX(i::Int, control::Int, target::Int)","category":"page"},{"location":"docstrings/#QuantumCircuitDraw.CX-Tuple{Int64, Int64, Int64}","page":"Docstrings","title":"QuantumCircuitDraw.CX","text":"CX(i::Int, control::Int, target::Int)\n\nDraws a controlled X gate at step i with control and target qubits.\n\n\n\n\n\n","category":"method"},{"location":"docstrings/","page":"Docstrings","title":"Docstrings","text":"CY(i::Int, control::Int, target::Int)","category":"page"},{"location":"docstrings/#QuantumCircuitDraw.CY-Tuple{Int64, Int64, Int64}","page":"Docstrings","title":"QuantumCircuitDraw.CY","text":"CY(i::Int, control::Int, target::Int)\n\nDraws a controlled Y gate at step i with control and target qubits.\n\n\n\n\n\n","category":"method"},{"location":"docstrings/","page":"Docstrings","title":"Docstrings","text":"CZ(i::Int, control::Int, target::Int)","category":"page"},{"location":"docstrings/#QuantumCircuitDraw.CZ-Tuple{Int64, Int64, Int64}","page":"Docstrings","title":"QuantumCircuitDraw.CZ","text":"CZ(i::Int, control::Int, target::Int)\n\nDraws a controlled Z gate at step i with control and target qubits.\n\n\n\n\n\n","category":"method"}]
}
