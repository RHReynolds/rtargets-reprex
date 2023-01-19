# Load packages required to define the pipeline:
library(desc)
library(targets)
library(tarchetypes)

# Set target options:
tar_option_set(
  # use DESCRIPTION to define dependencies
  packages = desc::desc_get_deps(file = ".")[["package"]], # packages that your targets need to run
)

# Pipeline:
list(
  targets::tar_target(
    name = fig_dir,
    command = file.path("docs", "figures"),
    format = "file"
  ),
  tarchetypes::tar_render(
    name = report,
    path = file.path("docs", "example.rmd")
  )
)
