
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
