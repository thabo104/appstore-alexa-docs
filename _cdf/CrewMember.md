---
---

## CrewMember {#CrewMember}

Contains elements that provide information about a person in the work's off-screen crew, such as a director, writer, cinematographer, best boy, animator, or grip. When present, the optional [Credits](#Credits) must include at least one entry, either a [CastMember](#CastMember) or a CrewMember. You can include as many CrewMember elements as needed.

**Required if no CastMember element is present, otherwise optional:**

| Added | CDF version 1.0 |
| Parent Elements | [Credits](#Credits) |
| Child Elements | [Name](#Name) (required), [ExternalID](#ExternalID) (optional), [Job](#Job) (optional) |
| Attributes | None |

**Example:**

```xml
<Credits>
  <CrewMember>
    <Name locale="en-US">Alan Smithee</Name>
    <ExternalID scheme="imdb">tt0000000</ExternalID>
    <Job locale="en-US">Director</Job>
  </CrewMember>
</Credits>
```
