options(repos = c(CRAN = "http://cran.us.r-project.org"))

# Function to set plot background color
set_plot_bg <- function(color = "white") {
  par(bg = color)
}

# Set plot background color to white by default
setHook("plot.new", function() par(bg = "white"))

# Load vscDebugger package and attach if interactive session
if (interactive()) {
  tryCatch({
    library(vscDebugger)
    .vsc.attach()
  }, error = function(e) {
    message("vscDebugger package not available")
  })
}
