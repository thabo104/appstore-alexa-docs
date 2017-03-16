---
---

## Count {#Count}

The number of users that have contributed to a customer rating [Score](#Score). Only one Count is allowed per [CustomerRating](#CustomerRating).

**Optional:**

| Added | CDF version 1.2 |
| Parent Elements | [CustomerRating](#CustomerRating) |
| Child Elements | None |
| Attributes | None |
| Accepted values | Any non-negative whole number. |

**Example:**

```xml
<CustomerRating>
  <Score>8.2</Score>
  <MaxValue>10</MaxValue>
  <Count>512</Count>
</CustomerRating>
```
