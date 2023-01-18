# Load packages required to define the pipeline:
library(desc)
library(here)
library(targets)
library(tarchetypes)

# Set target options:
tar_option_set(
    # use DESCRIPTION to define dependencies
    packages =
        desc::desc_get_deps(file = ".")[["package"]], # packages that your targets need to run
    repository = "local"
    # Set other options as needed.
)

# Replace the target list below with your own:
list(
    targets::tar_target(
        name = fig_dir,
        command = here::here("docs", "figures"),
        format = "file"
    ),
    tarchetypes::tar_render(
        name = report,
        path = here::here("docs", "example.rmd"),
        params =
            list(
                ext_figures = fig_dir
            )
    )
)
