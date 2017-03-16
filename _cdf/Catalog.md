---
---

## Catalog {#Catalog}

The root element of a CDF file. Each catalog file must contain a single Catalog element which contains the rest of the file.

**Required:**

| Added | CDF version 1.0 | | |
| Parent Elements | None | | |
| Child Elements | [Partner](#partner) (required), [Works](#works) (required) | | |
| Attributes | | | |
| | Attribute | Accepted Values | Description |
| | xmlns | http://www.amazon.com/ FireTv/2014-04-11/ingestion | **Required**. The XML namespace. |
| | SchemaVersion | FireTv-v1.2 <br/> FireTv-v1.3 | **Optional**. Added in CDF v1.2\. The version of the schema this catalog uses. Refer to the schema "id" to figure out which schema version you are using. Although this attribute is optional for compatibility reasons, we recommend that you provide the version. |

**Example**:

```xml
<xml version="1.0" encoding="utf-8" ?>
<Catalog xmlns="http://www.amazon.com/FireTv/2014-04-11/ingestion" version="FireTv-v1.3">
  <Partner>Everything Ever Made Filmworks</Partner>
  <Works>
    ...
  </Works>
<Catalog>
```
