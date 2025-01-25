
# General


```@docs
new_circuit_plot(N::Int, steps::Int; qubit_names=[], grid=false, dpi=300)
```
```@docs
circuit_plot(N::Int, circuit::Vector{Tuple{String, Vector{Real}}}; qubit_names=[], grid=false, dpi=300)
```
```@docs
paulistrings_plot(circuit; qubit_names=[], grid=false, dpi=300)
```
# Gates



```@docs
Single(i::Int, j::Int, name::String; color=default_color)
```

```@docs
Controlled(i::Int, control::Int, target::Int, name::String; color=default_color)
```

```@docs
MCZ(i::Int, sites::Vector{Int}; color=default_color)
```
```@docs
MCX(i::Int, controls::Vector{Int}, target::Int; color=default_color)
```

```@docs
CNOT(i::Int, control::Int, target::Int; color=default_color)
```

```@docs
CCNOT(i::Int, control1::Int, control2::Int, target::Int; color=default_color)
```

```@docs
CCX(i::Int, control1::Int, control2::Int, target::Int; color=default_color)
```

```@docs
Swap(i::Int, j1::Int, j2::Int; color=default_color)
```

```@docs
Measurement(i::Int, j::Int; color=default_color)
```

```@docs
CX(i::Int, control::Int, target::Int; color=default_color)
```

```@docs
CY(i::Int, control::Int, target::Int; color=default_color)
```

```@docs
CZ(i::Int, control::Int, target::Int; color=default_color)
```
