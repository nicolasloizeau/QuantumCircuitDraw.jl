


"""
    Single(i::Int, j::Int, name::String; color=default_color)

Draws a single-qubit gate at step `i` and qubit `j` with name `name`.
"""
Single(i::Int, j::Int, name::Union{String,LaTeXString}; color=default_color) = draw_box(i, j, name; color=color)

"""
    Controlled(i::Int, control::Int, target::Int, name::String; color=default_color)

Draws a controlled gate with `control` qubit and `target` qubit at step `i`.
"""
function Controlled(i::Int, control::Int, target::Int, name::Union{String,LaTeXString}; color=default_color)
    draw_circle(i, control; color=color)
    draw_vertical_line(i, control, target; color=color)
    draw_box(i, target, name; color=color)
end

"""
    MCZ(i::Int, sites::Vector{Int}; color=default_color)

Draws a multi-controlled Z gate acting on `sites` qubits at step `i`.
"""
function MCZ(i::Int, sites::Vector{Int}; color=default_color)
    for j in sites
        draw_circle(i, j; color=color)
    end
    draw_vertical_line(i, minimum(sites), maximum(sites); color=color)
end

"""
    MCX(i::Int, controls::Vector{Int}, target::Int; color=default_color)

Draws a multi-controlled X gate acting on `sites` qubits at step `i`.
"""
function MCX(i::Int, controls::Vector{Int}, target::Int; color=default_color)
    for j in controls
        draw_circle(i, j; color=color)
    end
    sites = vcat(controls, target)
    draw_vertical_line(i, minimum(sites), maximum(sites); color=color)
    draw_circle_plus(i, target; color=color)
end

"""
    CNOT(i::Int, control::Int, target::Int; color=default_color)

Draws a CNOT gate at step `i` with `control` and `target` qubits.
"""
function CNOT(i::Int, control::Int, target::Int; color=default_color)
    draw_vertical_line(i, control, target; color=color)
    draw_circle(i, control; color=color)
    draw_circle_plus(i, target; color=color)
end

"""
    CCNOT(i::Int, control1::Int, control2::Int, target::Int; color=default_color)

Draws a CCNOT gate at step `i` with `control1`, `control2`, and `target` qubits.
"""
function CCNOT(i::Int, control1::Int, control2::Int, target::Int; color=default_color)
    draw_vertical_line(i, control1, target; color=color)
    draw_vertical_line(i, control2, target; color=color)
    draw_circle(i, control1; color=color)
    draw_circle(i, control2; color=color)
    draw_circle_plus(i, target; color=color)
end

"""
    CCX(i::Int, control1::Int, control2::Int, target::Int; color=default_color)

Same as [`CCNOT`](@ref).
"""
CCX(i::Int, control1::Int, control2::Int, target::Int; color=default_color) = CCNOT(i, control1, control2, target; color=color)

"""
    Swap(i::Int, j1::Int, j2::Int; color=default_color)

Draws a SWAP gate at step `i` between qubits `j1` and `j2`.
"""
function Swap(i::Int, j1::Int, j2::Int; color=default_color)
    draw_vertical_line(i, j1, j2; color=color)
    draw_cross(i, j1; color=color)
    draw_cross(i, j2; color=color)
end

"""
    Measurement(i::Int, j::Int; color=default_color)

Draws a measurement gate at step `i` on qubit `j`.
"""
function Measurement(i::Int, j::Int; color=:black)
    draw_box(i, j, ""; color=color)
    c = [i, j + 0.1]
    r = 0.23
    plot!([c[1], c[1] + r], [c[2], c[2] - r], color=:white, linewidth=linewidth * 0.7)
    theta = 0:0.1:π
    x = r * cos.(theta) .+ c[1]
    y = -r * sin.(theta) .+ c[2]
    plot!(x, y, color=:white, linewidth=linewidth * 0.7)
end

"""
    CX(i::Int, control::Int, target::Int; color=default_color)

Draws a controlled X gate at step `i` with `control` and `target` qubits.
"""
CX(i::Int, control::Int, target::Int; color=default_color) = Controlled(i, control, target, "X"; color=color)

"""
    CY(i::Int, control::Int, target::Int; color=default_color)

Draws a controlled Y gate at step `i` with `control` and `target` qubits.
"""
CY(i::Int, control::Int, target::Int; color=default_color) = Controlled(i, control, target, "Y"; color=color)

"""
    CZ(i::Int, control::Int, target::Int; color=default_color)

Draws a controlled Z gate at step `i` with `control` and `target` qubits.
"""
CZ(i::Int, control::Int, target::Int; color=default_color) = Controlled(i, control, target, "Z"; color=color)


X(i::Int, j::Int; color=default_color) = Single(i, j, "X"; color=color)
Y(i::Int, j::Int; color=default_color) = Single(i, j, "Y"; color=color)
Z(i::Int, j::Int; color=default_color) = Single(i, j, "Z"; color=color)
H(i::Int, j::Int; color=default_color) = Single(i, j, "H"; color=color)
S(i::Int, j::Int; color=default_color) = Single(i, j, "S"; color=color)
T(i::Int, j::Int; color=default_color) = Single(i, j, "T"; color=color)
Tdg(i::Int, j::Int; color=default_color) = Single(i, j, "T†"; color=color)
Phase(i::Int, j::Int, theta::Real; color=default_color) = Single(i, j, "P(θ)"; color=color)
