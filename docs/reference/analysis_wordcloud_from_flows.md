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
yearly_clouds[["2015"]]

{"x":{"word":[],"freq":[],"fontFamily":"Segoe UI","fontWeight":"bold","color":"random-dark","minSize":0,"weightFactor":-0,"backgroundColor":"white","gridSize":0,"minRotation":-0.7853981633974483,"maxRotation":0.7853981633974483,"shuffle":true,"rotateRatio":0.5,"shape":"circle","ellipticity":0.8,"figBase64":null,"hover":null},"evals":[],"jsHooks":{"render":[{"code":"function(el,x){\n                        console.log(123);\n                        if(!iii){\n                          window.location.reload();\n                          iii = False;\n\n                        }\n  }","data":null}]}}yearly_clouds[["2024"]]

{"x":{"word":["protection","assistance","emergency","health","populations","vulnerable","services","affected","communities","integrated","réponse","lifesaving","conflict","needs","education","food","refugees","nutrition","access","crisis","sudan","people","multisectoral","children","strengthening","violence","host","provision","action","wash","displaced","afghanistan","security","resilience","disaster","ukraine","population","crises","south","areas","rapid","affectées","preparedness","refugee","conflictaffected","central","syria","multisector","colombia","contribution","local","regional","republic","cash","enhancing","women","coordination","improving","basic","management","crise","yemen","comprehensive","mozambique","child","displacement","providing","community","inclusive","supporting","emergencies","vulnérables","idps","mali","shelter","province","urgence","appeal","besoins","crisisaffected","programme","multisectorielle","nord","returnees","venezuela","intégrée","nigeria","climate","ethiopia","north","development","safe","girls","quality","somalia","déplacées","households","sexual","africa","based"],"freq":[973,770,655,590,561,537,521,475,440,393,328,306,293,293,284,281,280,278,265,252,247,243,240,230,221,218,215,215,214,208,188,177,175,173,170,167,165,163,161,160,159,157,156,156,149,146,146,143,140,140,140,137,135,131,131,131,127,121,119,117,116,116,112,112,110,110,109,108,106,106,105,103,101,101,100,98,98,95,95,93,93,92,92,92,91,89,88,87,87,87,86,86,85,84,83,82,80,79,78,78],"fontFamily":"Segoe UI","fontWeight":"bold","color":"random-dark","minSize":0,"weightFactor":0.1294964028776978,"backgroundColor":"white","gridSize":0,"minRotation":-0.7853981633974483,"maxRotation":0.7853981633974483,"shuffle":true,"rotateRatio":0.5,"shape":"circle","ellipticity":0.8,"figBase64":null,"hover":null},"evals":[],"jsHooks":{"render":[{"code":"function(el,x){\n                        console.log(123);\n                        if(!iii){\n                          window.location.reload();\n                          iii = False;\n\n                        }\n  }","data":null}]}}yearly_clouds[["2025"]]

{"x":{"word":["emergency","conflict","protection","assistance","displacement","health","vulnerable","populations","food","services","lifesaving","integrated","communities","nutrition","needs","first","affected","réponse","wash","multisectoral","provision","disaster","sudan","education","refugees","access","rapid","security","children","climate","areas","conflictaffected","natural","crisis","contribution","people","multisectorielle","south","violenceclashes","besoins","action","emergencies","host","shelter","resilience","idps","cerf","strengthening","drought","affectées","displaced","syria","ukraine","republic","yemen","water","communautés","violence","gaza","returnees","fund","postconflict","cash","regional","enhancing","cholera","population","refugee","afghanistan","child","congo","santé","women","hôtes","gbv","state","north","crise","coordination","providing","safe","provinces","underfunded","risk","province","urgence","ocha","crises","nigeria","flood","inclusive","vulnérables","central","families","west","africa","hygiene","venezuela","somalia","darfur"],"freq":[5826,3829,3145,2585,2249,1833,1757,1732,1698,1638,1622,1536,1462,1362,1354,1311,1222,1206,1014,952,901,884,872,869,865,818,787,781,750,734,712,701,696,670,668,664,631,604,597,593,583,570,555,542,526,515,504,483,479,476,474,472,466,464,462,457,454,448,436,430,420,420,411,407,406,404,400,399,391,391,379,379,371,369,364,358,354,348,346,346,337,333,326,324,318,312,311,308,307,306,301,300,299,298,298,297,296,295,294,289],"fontFamily":"Segoe UI","fontWeight":"bold","color":"random-dark","minSize":0,"weightFactor":0.02162718846549948,"backgroundColor":"white","gridSize":0,"minRotation":-0.7853981633974483,"maxRotation":0.7853981633974483,"shuffle":true,"rotateRatio":0.5,"shape":"circle","ellipticity":0.8,"figBase64":null,"hover":null},"evals":[],"jsHooks":{"render":[{"code":"function(el,x){\n                        console.log(123);\n                        if(!iii){\n                          window.location.reload();\n                          iii = False;\n\n                        }\n  }","data":null}]}}
```
