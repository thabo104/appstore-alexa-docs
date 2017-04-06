## Handling Live Media

If you have live media, you can adjust the app so that just one button appears on the Content Details screen: Watch Now. (This is because with live content, you can't rewind and "Watch from Beginning.")

If you want to mark your entire feed as live, open **Navigator.json** (located in your **app > assets** folder), and add the following property shown in red. Some content before and after the object is shown to provide context.

<pre>
     ...
{
      "categories": {
        "name": "Hardcoded Category Name"
      },
      "contents": {
        "dataLoader": "recipes/LightCastDataLoaderRecipe1.json",
        "dynamicParser": "recipes/LightCastAllContentsRecipe.json"
      },
      <span class="red">"recipeConfig": {
        "liveContent": true
      }</span>
    }
  ],
  "graph": {
    "com.amazon.android.tv.tenfoot.ui.activities.SplashActivity": {
      "verifyScreenAccess": false,
      "verifyNetworkConnection": true,
      "onAction": "CONTENT_SPLASH_SCREEN"
    },
    "com.amazon.android.tv.tenfoot.ui.activities.ContentBrowseActivity": {
    ...
</pre>

If you have only some media that is live, and it's mixed in with other content that isn't live, you can match this content in the `matchList` parameter when you query for your contents. Here's an example:

<pre>
{
  "cooker": "DynamicParser",
  "format": "xml",
  "translator":"ContentTranslator",
  "model": "com.amazon.android.model.content.Content",
  "modelType": "array",
  "query": "rss/channel/item",
  "matchList": [
    "title/#text@title",
    "id/#text@id",
    "description/#text@description",
    "url/#text@url",
    "image/#text@cardImageUrl",
    "image/#text@backgroundImageUrl",
    <span class="red">"live/#text@live"</span>
  ]
}
</pre>

In this example, `live/#text` is used to target the part of the feed that contains the live tag.

## Hard-Coding Your Categories {#hardcodingcategories}

If your feed doesn't include categories in the feed structure, you can hard-code a category name in Navigator.json and insert the entire media feed for that hard-coded category. Instead of loading your categories from the LightCastCategoriesRecipe.json file, you configure the categories inside the `globalRecipes` object  in Navigator.json like this:

```json
"globalRecipes": [
  {
    "categories" : {
      "name" : "Acme Category 1: Coyotes"
    },
    "contents": {
      "dataLoader": "recipes/AcmeDataLoaderRecipe0.json",
      "dynamicParser": "recipes/AcmeContentsRecipe.json"
    }
  },

  {
    "categories" : {
      "name" : "Acme Category 2: Roadrunner"
    },
    "contents": {
      "dataLoader": "recipes/AcmeDataLoaderRecipe1.json",
      "dynamicParser": "recipes/AcmeContentsRecipe.json"
    }
  }
]
```

Note that you only load the contents recipe, not the categories recipe (since you don't have categories in your feed). The `contents` object is loaded in the same way described in the previous section, with a separate AcmeDataLoaderRecipe[#] file for each media URL in the URL file.

For example, AcmeDataLoaderRecipe0.json would be:

```json
{
  "task": "load_data",
  "url_generator": {
    "url_index": "0"
  }
}
```

And AcmeDataLoaderRecipe1.json would be:

```json
{
  "task": "load_data",
  "url_generator": {
    "url_index": "1"
  }
}
```

In your urlFile.json, you list different feed URLs for each category, like this:

{
  "urls": [
    "http://www.url-for-my-category1-feed-coyotes.json",
    "http://www.url-for-my-category2-feed-roadrunner.json"
  ]
}

The first URL corresponds to `url_index` at position `0`. The second URL corresponds to `url_index` at position `1`.

## Next Steps

Now that your feed is configured, it's time to start customizing the look and feel of your app. See [Customize the Look and Feel of Your App][fire-app-builder-customize-look-and-feel].
