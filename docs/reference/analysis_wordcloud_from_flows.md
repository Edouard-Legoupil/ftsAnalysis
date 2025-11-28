# Generate a Word Cloud from Flow Descriptions

Aggregates flow descriptions, cleans the text, and generates a word
cloud. Optionally facets the word cloud generation by budget year.

## Usage

``` r
analysis_wordcloud_from_flows(
  flows,
  facet_by_year = FALSE,
  min_freq = 5,
  max_words = 100,
  stopwords = c("project", "response", "support", "activities", "million", "allocation",
    "reserve", "usd", "flow", "end", "start", "standard", "date", "code", "type",
    "humanitarian", "region", "plan", "humanitaire", "r<c3><a9>ponse")
)
```

## Arguments

- flows:

  Dataframe `flows`.

- facet_by_year:

  Logical scalar: If TRUE, returns a list of word clouds, one for each
  unique budget year. If FALSE, returns a single word cloud from all
  descriptions combined.

- min_freq:

  Integer: Minimum frequency of a word to be included in the cloud.

- max_words:

  Integer: Maximum number of words to display in the cloud.

- stopwords:

  Character vector: Additional words to remove (beyond standard English
  stopwords).

## Value

A wordcloud2 object (if facet_by_year=FALSE) or a named list of
wordcloud2 objects (if facet_by_year=TRUE).

## Examples

``` r
analysis_wordcloud_from_flows(flows, facet_by_year = FALSE)

{"x":{"word":["emergency","protection","conflict","assistance","health","vulnerable","services","populations","displacement","food","communities","integrated","lifesaving","affected","needs","nutrition","réponse","education","wash","refugees","first","access","sudan","multisectoral","provision","security","action","children","disaster","crisis","areas","people","women","rapid","violence","contribution","conflictaffected","host","climate","resilience","south","strengthening","ukraine","displaced","natural","shelter","multisectorielle","emergencies","crises","syria","local","besoins","yemen","population","idps","affectées","refugee","gbv","regional","republic","afghanistan","water","cash","enhancing","fund","child","violenceclashes","cerf","gaza","drought","returnees","coordination","communautés","providing","girls","state","community","multisector","inclusive","preparedness","risk","safe","livelihoods","north","central","santé","crise","ocha","venezuela","africa","families","congo","nigeria","province","lebanon","somalia","hôtes","improving","quality","west"],"freq":[6807,4722,4286,3723,3003,2612,2523,2517,2456,2389,2306,2148,2086,2024,1823,1780,1593,1446,1364,1340,1329,1309,1301,1253,1232,1209,1165,1155,1154,1124,1025,1025,994,977,957,955,951,947,916,896,875,843,824,797,789,742,738,718,712,708,705,699,692,688,674,661,655,651,646,646,645,633,623,622,606,600,597,592,586,575,557,548,543,540,526,523,520,514,512,512,511,510,506,504,494,485,479,473,456,453,451,447,447,445,441,440,437,436,436,431],"fontFamily":"Segoe UI","fontWeight":"bold","color":"random-dark","minSize":0,"weightFactor":0.01851035698545615,"backgroundColor":"white","gridSize":0,"minRotation":-0.7853981633974483,"maxRotation":0.7853981633974483,"shuffle":true,"rotateRatio":0.5,"shape":"circle","ellipticity":0.8,"figBase64":null,"hover":null},"evals":[],"jsHooks":{"render":[{"code":"function(el,x){\n                        console.log(123);\n                        if(!iii){\n                          window.location.reload();\n                          iii = False;\n\n                        }\n  }","data":null}]}}# Returns a named list of word cloud objects
yearly_clouds <- analysis_wordcloud_from_flows(flows, facet_by_year = TRUE)
#> Warning: no non-missing arguments to max; returning -Inf
#> Warning: no non-missing arguments to max; returning -Inf
#> Warning: no non-missing arguments to max; returning -Inf
#> Warning: no non-missing arguments to max; returning -Inf
#> Warning: no non-missing arguments to max; returning -Inf

# To view the cloud for a specific year  
print(yearly_clouds[["2015"]])
print(yearly_clouds[["2024"]])
print(yearly_clouds[["2025"]])
```
