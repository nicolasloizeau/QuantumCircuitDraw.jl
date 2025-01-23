


"""
    Single(i::Int, j::Int, name::String)

Draws a single-qubit gate at step `i` and qubit `j` with name `name`.
"""
Single(i::Int, j::Int, name::String) = draw_box(i, j, name)

"""
    Controlled(i::Int, control::Int, target::Int, name::String)

Draws a controlled gate with `control` qubit and `target` qubit at step `i`.
"""
function Controlled(i::Int, control::Int, target::Int, name::String)
    draw_circle(i, control)
    draw_vertical_line(i, control, target)
    draw_box(i, target, name)
end

"""
    MCZ(i::Int, sites::Vector{Int})

Draws a multi-controlled Z gate acting on `sites` qubits at step `i`.
"""
function MCZ(i::Int, sites::Vector{Int})
    for j in sites
        draw_circle(i, j)
    end
    draw_vertical_line(i, minimum(sites), maximum(sites))
end

"""
    MCX(i::Int, controls::Vector{Int}, target::Int)

Draws a multi-controlled X gate acting on `sites` qubits at step `i`.
"""
function MCX(i::Int, controls::Vector{Int}, target::Int)
    for j in controls
        draw_circle(i, j)
    end
    sites = vcat(controls, target)
    draw_vertical_line(i, minimum(sites), maximum(sites))
    daw_circle_plus(i, target)
end

"""
    CNOT(i::Int, control::Int, target::Int)

Draws a CNOT gate at step `i` with `control` and `target` qubits.
"""
function CNOT(i::Int, control::Int, target::Int)
    draw_vertical_line(i, control, target)
    draw_circle(i, control)
    daw_circle_plus(i, target)
end

"""
    CCNOT(i::Int, control1::Int, control2::Int, target::Int)

Draws a CCNOT gate at step `i` with `control1`, `control2`, and `target` qubits.
"""
function CCNOT(i::Int, control1::Int, control2::Int, target::Int)
    draw_vertical_line(i, control1, target)
    draw_vertical_line(i, control2, target)
    draw_circle(i, control1)
    draw_circle(i, control2)
    daw_circle_plus(i, target)
end

"""
    CCX(i::Int, control1::Int, control2::Int, target::Int)

Same as [`CCNOT`](@ref).
"""
CCX(i::Int, control1::Int, control2::Int, target::Int) = CCNOT(i, control1, control2, target)

"""
    Swap(i::Int, j1::Int, j2::Int)

Draws a SWAP gate at step `i` between qubits `j1` and `j2`.
"""
function Swap(i::Int, j1::Int, j2::Int)
    draw_vertical_line(i, j1, j2)
    draw_cross(i, j1)
    draw_cross(i, j2)
end

"""
    Measurement(i::Int, j::Int)

Draws a measurement gate at step `i` on qubit `j`.
"""
function Measurement(i::Int, j::Int)
    draw_box(i, j, ""; color=:black)
    c = [i, j + 0.1]
    r = 0.23
    plot!([c[1], c[1] + r], [c[2], c[2] - r], color=:white, linewidth=linewidth * 0.7)
    theta = 0:0.1:π
    x = r * cos.(theta) .+ c[1]
    y = -r * sin.(theta) .+ c[2]
    plot!(x, y, color=:white, linewidth=linewidth * 0.7)
end

"""
    CX(i::Int, control::Int, target::Int)

Draws a controlled X gate at step `i` with `control` and `target` qubits.
"""
CX(i::Int, control::Int, target::Int) = Controlled(i, control, target, "X")

"""
    CY(i::Int, control::Int, target::Int)

Draws a controlled Y gate at step `i` with `control` and `target` qubits.
"""
CY(i::Int, control::Int, target::Int) = Controlled(i, control, target, "Y")

"""
    CZ(i::Int, control::Int, target::Int)

Draws a controlled Z gate at step `i` with `control` and `target` qubits.
"""
CZ(i::Int, control::Int, target::Int) = Controlled(i, control, target, "Z")
