```@setup index
using Plots; gr()
Plots.reset_defaults()
```



# QuantumCircuitDraw Documentation

## Example

```@example index
using Plots
using QuantumCircuitDraw

N = 5 # number of qubits
steps = 8 # number of steps in the circuit
new_circuit_plot(N, steps; grid=false) #initialize the plot

Single(1, 3, "U")
Single(3, 1, "X")
Controlled(1, 1, 2, "X")
CY(2, 4, 2)
CNOT(3, 4, 5)
CCNOT(4, 4, 2, 3)
Swap(5, 1, 5)
MCX(6, [2, 3, 4], 1)
MCZ(7, [5, 3, 4])
Measurement(8, 1)
Measurement(8, 2)
```

## Documentation


```@docs
new_circuit_plot(N::Int, steps::Int; qubit_names=[], grid=false, dpi=300)
```


```@docs
Single(i::Int, j::Int, name::String)
```

```@docs
Controlled(i::Int, control::Int, target::Int, name::String)
```

```@docs
MCZ(i::Int, sites::Vector{Int})
```
```@docs
MCX(i::Int, controls::Vector{Int}, target::Int)
```

```@docs
CNOT(i::Int, control::Int, target::Int)
```

```@docs
CCNOT(i::Int, control1::Int, control2::Int, target::Int)
```

```@docs
CCX(i::Int, control1::Int, control2::Int, target::Int)
```

```@docs
Swap(i::Int, j1::Int, j2::Int)
```

```@docs
Measurement(i::Int, j::Int)
```

```@docs
CX(i::Int, control::Int, target::Int)
```

```@docs
CY(i::Int, control::Int, target::Int)
```

```@docs
CZ(i::Int, control::Int, target::Int)
```
