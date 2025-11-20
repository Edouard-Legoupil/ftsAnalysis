# `{ftsAnalysis}`

The goal of `{ftsAnalysis}` is to provide a set of metrics, index,
analysis and visualization to better understand data from [OCHA
Financial Tracking
Service](https://fts.unocha.org/content/about-fts-using-fts-data).

This package enables the creation of detailed reports, with included
automated AI analysis from 3 angles:

- Donors
- Recipients
- Destinations

## Installation

You can install the development version of ftsAnalysis from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("Edouard-Legoupil/ftsAnalysis")
```

The package includes a function to build data stories from each plot.

To use it you can use Ollama or Set the LLM inference API key in your
environment with:

``` r
Sys.setenv(OPENAI_API_KEY = "<YOUR_OPENAI_KEY>")
Sys.setenv(GEMINI_API_KEY = "<YOUR_GOOGLE_GEMINI_KEY>")
Sys.setenv(ANTHROPIC_API_KEY = "<YOUR_ANTHROPIC_KEY>")
```
