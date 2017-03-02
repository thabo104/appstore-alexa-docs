---
---

## ContentRatings {#ContentRatings}

Contains one or more official ratings for the work, as determined by a specified certifying agency. Only one ContentRatings element is allowed per work.

**Optional:**

| Added | CDF version 1.0 |
| Parent Elements | [Movie](#Movie), [TvShow](#TvShow), [TvSeason](#TvSeason), [TvEpisode](#TvEpisode), [TvSpecial](#TvSpecial), [MiniSeries](#MiniSeries), [MiniSeriesEpisode](#MiniSeriesEpisode), [Extra](#Extra) |
| Child Elements | [ContentRating](#ContentRating) (at least one required) |
| Attributes | None |

**Example:**

```xml
<ContentRatings>
  <ContentRating>
    <System>MPAA</System>
    <Certification>PG-13</Certification>
  </ContentRating>
  <ContentRating>
    <System>Eirin</System>
    <Certification>R15+</Certification>
  </ContentRating>
</ContentRatings>
```
