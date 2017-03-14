---
---

# ContentRating {#ContentRating}

Contains elements that specify a rating system or organization and the rating they gave the work. When present, the optional [ContentRatings](#ContentRatings) must contain at least one ContentRating. You can have as many ContentRating elements as you need, one for each system/rating pair.


**Required if the optional ContentRatings element is present:**

| Added | CDF version 1.0 |
| Parent Elements | [ContentRatings](#ContentRatings) |
| Child Elements | [System](#System) (required), [Certification](#Certification) (required) |
| Attributes | None |

**Example:**

```xml
<ContentRatings>
  <ContentRating>
    <System>MPAA</System>
    <Certification>PG-13</Certification>
  </ContentRating>
</ContentRatings>
```
