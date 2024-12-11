## Script name: Save_As_svg_png_Functions.R
##
## Purpose of script: 
##      # A function for saaving plots as .svg and .png files 
##
## Date Created: 10-12-2024
##

save_plot_as_png <- function(plot, filename, size, res) {
  ggsave(filename, plot = plot, device = "png", width = size, height = size, units = "cm", dpi = res)
}

# Function to save plot as SVG
save_plot_as_svg <- function(plot, filename, size) {
  ggsave(filename, plot = plot, device = "svg", width = size, height = size, units = "cm")
}
