## Customize the Tag Names {#customtagnames}

You can customize the names of the analytics tags. (Tags are action or attribute names). Customizing the names can make it easier to identify activities you're interested in.

The complete list of analytics tags are available in `AnalyticsInterface > java > com.amazon.analytics > AnalyticsTags.java`.

Here's an example tag:

```java
public static final String ACTION_START_APP = "ACTION_START_APP";
```

`ACTION_START_APP` (on the left) is the tag, and `ACTION_START_APP` (on the right) is how the tag appears in your analytics. In this case, it's the same. You can customize this term with a more friendly, meaningful name.

**To customize these tags with your own names:**

1.  Browse to your app's **assets > configurations** directory.
2.  Add a JSON file to this directory called **{{include.filename}}**.
3.  Add the tags you want to customize using the following format:

    ```
    {
      "TAG": "value",
      "TAG": "value"
    }
    ```

    For example, to customize the `ACTION_START_APP` and `ACTION_SEARCH` tags, add them like this:

    ```
    {
      "ACTION_START_APP":"Start App",
      "ACTION_SEARCH": "Search"
    }
    ```

    The values on the left map to the analytics tags in AnalyticsTags.java. The values on the right map to the new values for the tags.

    If you add a tag that is not customizable, you will see a warning in the logs indicating that the tag cannot be customized. The customization will be ignored.

{% include tip.html content="If you want to track additional attributes from your feed that aren't used in the Fire Builder UI, see [Track Feed Attributes That Aren't Used in Fire App Builder][fire-app-builder-track-additional-attributes]." %}
