---
---

## Credits {#Credits}

Contains elements that represent a work's cast and crew members. The same person can appear as both cast or crew multiple times. Each work can contain only one Credits element. If present, Credits must contain at least one [CastMember](#CastMember) or [CrewMember](#CrewMember), though it can contain as many of each of those elements as needed.

**Optional:**

| Added | CDF version 1.0 |
| Parent Elements | [Movie](#Movie), [TvShow](#TvShow), [TvSeason](#TvSeason), [TvEpisode](#TvEpisode), [TvSpecial](#TvSpecial), [MiniSeries](#MiniSeries), [MiniSeriesEpisode](#MiniSeriesEpisode), [Extra](#Extra) |
| Child Elements | [CastMember](#CastMember), [CrewMember](#CrewMember) (at least one of these two is required) |
| Attributes | None |

**Example:**

```xml
<Credits>
  <CastMember>
    <Name locale="en-US">Alan Smithee</Name>
    <Role locale="en-US">Self</Role>
  </CastMember>
</Credits>
```
