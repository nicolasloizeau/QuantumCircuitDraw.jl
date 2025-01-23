rectangle(x, y, w, h) = Shape(x .+ [0, w, w, 0], y .+ [0, 0, h, h])

function draw_lines(N, steps)
    for i in 1:N
        plot!([wbox / 2, steps + 1 - wbox / 2], [i, i], color=:black, linewidth=linewidth)
    end
end

function draw_vertical_line(i, j1, j2)
    plot!([i, i], [j1, j2], color=color, linewidth=linewidth)
end


function draw_box(i::Int, j::Int, name::String; color=color)
    plot!(rectangle(i - wbox / 2, j - wbox / 2, wbox, wbox), color=color, linewidth=0)
    annotate!(i, j, text(name, :black, :center))
end

function draw_circle(i::Int, j::Int)
    scatter!([i], [j], color=color, markersize=9, markershape=:circle, markerstrokewidth=0)
end

function daw_circle_plus(i, j)
    scatter!([i], [j], color=color, markersize=19, markershape=:circle, markerstrokewidth=0)
    plot!([i - 0.15, i + 0.15], [j, j], color=:white, linewidth=linewidth)
    plot!([i, i], [j - 0.15, j + 0.15], color=:white, linewidth=linewidth)
end


function subscript(text)
    subscripts = Dict(
        '0' => '₀', '1' => '₁', '2' => '₂', '3' => '₃', '4' => '₄',
        '5' => '₅', '6' => '₆', '7' => '₇', '8' => '₈', '9' => '₉',
    )
    return join([subscripts[c] for c in text])
end

function draw_cross(i, j)
    plot!([i - 0.15, i + 0.15], [j - 0.15, j + 0.15], color=color, linewidth=linewidth)
    plot!([i - 0.15, i + 0.15], [j + 0.15, j - 0.15], color=color, linewidth=linewidth)
end
