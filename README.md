
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{ftsAnalysis}`

<!-- badges: start -->

<!-- badges: end -->

The goal of `{ftsAnalysis}` is to provide a comprehensive toolkit for
analyzing humanitarian funding flows using **open data** from the [OCHA
Financial Tracking Service (FTS)](https://fts.unocha.org/). It offers a
set of metrics, indices, analysis, and visualizations to generate
insights about funding dynamics.

Language Models are used to automatically generate [narrative and
reports](articles/ai-powered-reports.html) from three key perspectives:

- **Donors**: Analyze funding behavior, consistency, and strategic
  alignment.
- **Recipients**: Evaluate funding stability, diversification, and
  dependency.
- **Destinations**: Assess funding coverage, gaps, and risks for
  specific crises or locations.

#### For Developers

The package is developed with
[{fusen}](https://thinkr-open.github.io/fusen/). You can install it from
GitHub with:

``` r
# install.packages("pak")
pak::pak("Edouard-Legoupil/ftsAnalysis")
```

To leverage the AI-powered data storytelling features (automated
narrative generation for plots), you need to set API keys in your
environment (e.g., in your `.Renviron` file) to configure access to
Large Language Models through Azure, OpenAI, Gemini or Anthropic.
Alternatively, you can use [Ollama](https://ollama.com/) for local
inference, leveraging Open Source & Reasoning Small Language Models like
[Gemma3](https://ollama.com/library/gemma3) or
[DeepSeek-R1](https://ollama.com/library/deepseek-r1).
