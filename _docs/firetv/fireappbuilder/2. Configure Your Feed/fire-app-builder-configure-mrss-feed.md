---
title: Configure a Media RSS (MRSS) Feed
permalink: fire-app-builder-configure-mrss-feed.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

If you have an [Media RSS (MRSS) feed][mrss], which follows a [formal specification][mrss-spec] used for services such as iTunes, you can follow an example configuration to simplify the setup. The sample MRSS feed in Fire App Builder uses a feed for a This Week in Tech (TWIT) podcast called [Ham Nation](https://twit.tv/shows/ham-nation), whose feed is publicly available [here](http://feeds.twit.tv/hn_video_hd.xml).

If your feed contains the same elements as the example feed, your setup can be as simple as swapping in your own feed URL and using the existing TWIT category and content recipes.

Note that MRSS feeds have a variety of potential elements. In the sample TWIT feed, the content elements in the feed are matched through an XPath query with the [`query` and `matchList` parameters in the contents recipe][fire-app-builder-set-up-recipes-content]. The matched MRSS elements include `title`, `guid`, `itunes:subtitle`, `<media:content url`, and `<media:content> <media:thumbnail>`. You can see the logic to match these elements in the **TwitTvContentRecipe.json** file (in your app's **assets > recipes** folder):

```json
"query": "//item",
"matchList": [
  "title/#text@title",
  "guid/#text@id",
  "itunes:subtitle/#text@description",
  "media:content/#attributes/url@url",
  "media:content/media:thumbnail/#attributes/url@cardImageUrl",
  "media:content/media:thumbnail/#attributes/url@backgroundImageUrl"
]
```

The categories are matched through the [`query` and `matchList` parameters in the categories recipe][fire-app-builder-set-up-recipes-categories]:

```json
"query": "//item/category/text()",
"queryResultType": "[]$",
"matchList": [
  "/StringKey@name"
]
```

For more details on how feed elements map to Fire App Builder UI elements, see these topics:

* [Set Up the Category Recipe][fire-app-builder-set-up-recipes-categories]
* [Set Up the Content Recipe][fire-app-builder-set-up-recipes-content]
* [Querying XML][fire-app-builder-querying-xml]

Note that the `url` in your feed element cannot point to a source on YouTube, Vimeo, or Dropbox. Your videos need to be on a host that allows your app to access the media directly. Additionally, your app must match on all of the elements listed in the previous code sample. For example, you cannot omit one of the elements (such as the `url`). Otherwise your build will fail.

{% include note.html content="The TWIT feed is used here as an example MRSS feed only. Amazon is not associated with TWIT. Additionally, per Appstore content ownership policies, note you cannot submit apps containing content that you do not own. For example, you cannot submit apps of your favorite videocasts just so you can watch them on Fire TV." %}

## Configure Fire App Builder with the TWIT Feed

Before swapping in your own MRSS feed into the sample TWIT configuration, let's build Fire App Builder using the TWIT feed to get a sense of how it looks and works.

To configure Fire App Builder to use the TWIT feed:

1.  Open **BasicFileBasedUrlGeneratorConfig.json** (in your app's **assets > configurations** folder). Change the value for the `url_file` property to `twitTvUrlFile.json`:

    ```json
    {
      "url_file": "twitTvUrlFile.json"
    }
    ```
2.  In your app's **assets** folder, rename **Navigator.json** to something like **Navigator_original.json**.
3.  Rename **Navigator_TwitTv.json** to **Navigator.json**.
4.  Click the **Run App** button {% include inline_image.html alt="Run 'app'" file="firetv/fireappbuilder/images/fireappbuilder_runappbutton" type="png" %}.

The TWIT feed populates in Fire App Builder and looks as follows:

{% include image.html file="firetv/fireappbuilder/images/fireappbuilder-twitscreen" type="png" max-width="" alt="TWIT feed" %}

## Configure Fire App Builder with Your Own MRSS Feed

To configure Fire App Builder with your own MRSS feed, just swap it in place of the TWIT feed. You can also rename some files so they reflect your own feed rather than saying "Twit."

{% include note.html content="For demonstration purposes, we'll assume you have an MRSS feed called Acme." %}

1.  Duplicate the **twitTvUrlFile.json** file (in your app's **assets** folder) and give it a unique name, such as **AcmeUrlFile.json**.
1.  Open **BasicFileBasedUrlGeneratorConfig.json** (in your app's **assets > configurations** folder). Change the value for the `url_file` to the name of the file you created in the previous step (such as "AcmeUrlFile.json").
2.  Open the "AcmeUrlFile.json" file and replace the URL with your own MRSS feed URL:

    ```json
    {
       "urls": [
          "http://acmewebsite.come/myfeed.xml"
       ]
    }
    ```

3.  If you followed the instructions in the previous section and renamed **Navigator_TwitTv.json** (in your app's **assets** folder) to **Navigator.json**, then rename **Navigator.json** back to **Navigator_TwitTv.json**.
4.  If you have a file called **Navigator.json** (in your app's **assets** folder), change its name to **Navigator_original.json** (or something similar).
3.  Duplicate **Navigator_TwitTv.json** and name it **Navigator.json**.
4.  Open up **Navigator.json** and customize the recipe and data loader files with unique names in the `globalRecipes` object. The content in the file originally has these file names:

    ```json
    "globalRecipes": [
      {
        "categories": {
          "dataLoader": "recipes/TwitTvDataLoaderRecipe0.json",
          "dynamicParser": "recipes/TwitTvCategoriesRecipe.json"
        },
        "contents": {
          "dataLoader": "recipes/TwitTvDataLoaderRecipe0.json",
          "dynamicParser": "recipes/TwitTvContentsRecipe.json"
        }
      }
    ]
    ```

    If your app were named Acme, you might rename these JSON files as follows:

    ```json
    "globalRecipes": [
       {
         "categories": {
           "dataLoader": "recipes/AcmeDataLoaderRecipe0.json",
           "dynamicParser": "recipes/AcmeCategoriesRecipe.json"
         },
         "contents": {
           "dataLoader": "recipes/AcmeDataLoaderRecipe0.json",
           "dynamicParser": "recipes/AcmeContentsRecipe.json"
         }
       }
     ]
    ```

5. Duplicate the **TwitTvDataLoaderRecipe0.json**, **TwitTvContentsRecipe.json**, and **TwitTvCategoriesRecipe.json** files and give them unique names to match the names you customized in the previous step's code.

6. Click the **Run App** button {% include inline_image.html alt="Run 'app'" file="firetv/fireappbuilder/images/fireappbuilder_runappbutton" type="png" %}.

If successful, your app should look similar to the sample TWIT Ham Nation app but with your own feed's content. The feed items are grouped into different categories based on the `category` element in your feed. If the same item has multiple categories, that item will appear in each category group.

For information on how to change the look and feel of the app, including how to change the logo, see [Customize the Look and Feel of Your App][fire-app-builder-customize-look-and-feel].


[mrss]: https://en.wikipedia.org/wiki/Media_RSS
[mrss-spec]: http://www.rssboard.org/media-rss

{% include links.html %}
