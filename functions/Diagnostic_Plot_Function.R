## Script name: Diagnostic_Plot_Function.R
##
## Purpose of script: 
##      # A function for creating diagnostic plots 
##
## Date Created: 10-12-2024
##

# Create diagnostic plot
Diagnostic_Plot_Function <- function() {
  plot(linear_model)  
}

# Save diagnostic plot as .png
save_diagnostic_plot_as_png <- function(filename, plot_func, size, res, scaling) {
  agg_png(filename, width = size, height = size, units = "cm", res = res, scaling = scaling)
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 2))  
  plot_func()  
  dev.off() 
}

# Save diagnostic plot as .svg
save_diagnostic_plot_as_svg <- function(filename, plot_func, size, scaling) {
  size_inches <- size / 2.54  
  svglite(filename, width = size_inches, height = size_inches, scaling = scaling)
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 2))  
  plot_func()  
  dev.off()  
}