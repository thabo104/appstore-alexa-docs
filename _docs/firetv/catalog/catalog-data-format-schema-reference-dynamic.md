---
title: Fire TV Catalog Data Format (CDF) Schema - Dynamic
permalink: catalog-data-format-schema-reference-dynamic.html
sidebar: catalog
product: Fire TV Catalog
toc: false
github: true
---

{% for doc in site.cdf %}
<h2 id="{{doc.bookmark}}">{{doc.title}}</h2>
{{doc.description}}

<h3>Attributes</h3>
{{doc.attributes}}

<h3>Example</h3>
```xml
{{doc.example}}
```

{% endfor %}


test:

```xml
<Credits>
  <CastMember>
    <Name locale="en-US">Alan Smithee</Name>
    <ExternalID scheme="imdb">tt0000000</ExternalID>
    <Role locale="en-US">Self</Role>
  </CastMember>
</Credits>
```

{% include links.html %}
