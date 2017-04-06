---
title: Troubleshooting
permalink: fire-app-builder-troubleshooting.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

First consult the [Known Issues][fire-app-builder-release-notes-version-1-0-2] section in the release notes to see if any bugs you're experiencing are known.

If you can't resolve your issue, see the [Fire TV and Fire TV Stick](https://forums.developer.amazon.com/spaces/43/Fire+TV+and+Fire+TV+Stick.html) categories on the Support Forums.

## Error: Content not allowed in prolog

**Problem**: You try to build the project but get an error that says:

```
Error: Content is not allowed in prolog
```

This error is related to Windows. When you cloned the Github repo, git didn't have symbolic linking configured to `true`. As a result, the symlinks used for some of the XML files didn't copy down with the right content.

**Resolution**: Configure git to use symbolic links:

```
git config –global core.symlinks true
```

Then re-clone the repo and build the project again. You can verify that symlinks are working by looking at the strings.xml file in **Utils > src > main > res > values > strings.xml > strings.xml (en-rUS)**. If you see normal content, symlinks are working. In contrast, if there's just a short reference and nothing else, symlinks aren't working.

### Errors: Recipe chain fails

**Problem**: You get this error message when building your app:

```
E/ContentBrowser: Recipe chain failed: com.amazon.dynamicparser.DynamicParser$InvalidParserRecipeException: Recipe cannot be null or empty
```

Or you see this:

```
Recipe chain failed: java.lang.Exception: com.amazon.dataloader.datadownloader.AUrlGenerator$UrlGeneratorException: Could not read url at index 0 in file null
```
**Resolution**:

Check your recipe file to make sure your JSON is valid. An extra comma that makes it invalid can cause this error. Also see that the Navigator.json file in your app's **assets > recipes** folder points to the correct files, and that your data loader file is loading the correct recipe.


**Problem**: You get this error message when building your app.

```
E/NavigatorModelParser: Navigator parsing failed!!! com.fasterxml.jackson.databind.JsonMappingException: Unexpected character ('}' (code 125)): was expecting double-quote to start field name
```

Check your Navigator.json file to make sure the JSON is valid. An extra comma that makes it invalid can cause this error.

{% include links.html %}
