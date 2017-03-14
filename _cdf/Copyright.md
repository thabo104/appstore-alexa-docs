---
---

## Copyright {#Copyright}

A statement of the work's copyright.

**Optional:**

| Added | CDF version 1.0 | |
| Parent Elements | [Movie](#Movie), [TvShow](#TvShow), [TvSeason](#TvSeason), [TvEpisode](#TvEpisode), [TvSpecial](#TvSpecial), [MiniSeries](#MiniSeries), [MiniSeriesEpisode](#MiniSeriesEpisode), [Extra](#Extra) |
| Child Elements | None |
| Attributes | | |
| | Attribute | Accepted Values | Description |
| locale | Standard XML/HTML language codes, such as en, en-US, fr, or fr-FR | **Required**. The device or software's language setting under which to use this string. |
| pronunciation | String | **Optional**. Used when the element's text is given in kanji. The expected sort order in Japanese is based on pronunciation (which cannot be determined from the kanji) rather than characters. The _pronunciation_ attribute provides that information, typically using hiragana. |

**Example:**

```xml
<Copyright locale="en-US">© 2014 Amazon Studios</Copyright>
```
