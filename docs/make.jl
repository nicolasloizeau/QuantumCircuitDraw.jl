using Documenter, QCPlots



makedocs(
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true",),
    sitename = "QCPlots.jl",
    authors  = "Nicolas Loizeau",
    pages = ["QCPlots Documentation" => "index.md"]
)

deploydocs(
    repo = "github.com/nicolasloizeau/QCPlots.jl.git",
    devbranch = "main",
    branch = "gh-pages",
)
