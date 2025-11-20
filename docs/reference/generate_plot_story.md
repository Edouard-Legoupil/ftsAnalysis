# Generate Humanitarian Data Story from ggplot

This function takes a ggplot2 object and generates a storytelling
narrative focused on humanitarian insights. It uses the {ellmer} package
to call a large language model from a supported provider.

## Usage

``` r
generate_plot_story(plot, max_tokens = 30, provider = NULL, model = NULL)
```

## Arguments

- plot:

  A `ggplot` object from ggplot2.

- max_tokens:

  Maximum number of tokens (approximate) for the narrative (default =
  30).

- provider:

  Optional character string specifying the provider. Options include:
  `"openai"`, `"gemini"`, `"anthropic"`, `"ollama"`. If `NULL`,
  auto-detect from environment keys.

- model:

  Optional character string specifying the model name. If `NULL`, a
  default model for the chosen provider will be used.

## Value

A character string containing a storytelling narrative focused on
humanitarian data.

## Details

The narrative can be used as a full‑text explanation or a concise
subtitle for plots. The LLM has access to the plot’s data (truncated for
efficiency), title, subtitle, and caption. Both provider and model can
be chosen explicitly or detected automatically based on which API key
environment variable is set.

Setup:

1.  Install {ellmer}: `install.packages("ellmer")`

2.  Use Ollama or Set your API key in your environment, for example:
    `Sys.setenv(OPENAI_API_KEY = "<YOUR_OPENAI_KEY>")`
    `Sys.setenv(GEMINI_API_KEY = "<YOUR_GOOGLE_GEMINI_KEY>")`
    `Sys.setenv(ANTHROPIC_API_KEY = "<YOUR_ANTHROPIC_KEY>")`

## Examples

``` r
library(ggplot2)
p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
   geom_point() +
    unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = FALSE) +
   labs(title = "Vehicle Efficiency",
        subtitle = "Fuel consumption vs weight",
        caption = "Source: mtcars dataset")

story <- generate_plot_story(p)
#> Using model = "gemini-2.5-flash".
cat(story)
#> Heavier aid vehicles burn more fuel, increasing costs and logistical challenges for life-saving missions.
# To use as subtitle:
p + ggplot2::labs(subtitle = story)
```
