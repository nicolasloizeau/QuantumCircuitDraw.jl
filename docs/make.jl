using Documenter, QCPlots



makedocs(
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true",),
    sitename = "QuantumCircuitDraw.jl",
    authors  = "Nicolas Loizeau",
    pages = ["QuantumCircuitDraw Documentation" => "index.md"]
)

deploydocs(
    repo = "github.com/nicolasloizeau/QuantumCircuitDraw.jl.git",
    devbranch = "main",
    branch = "gh-pages",
)
