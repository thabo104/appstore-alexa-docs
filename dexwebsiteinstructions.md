---
layout: none
---

1. Get the latest assets from [DeXWebsiteAUIAssets](https://code.amazon.com/packages/DeXWebsiteAUIAssets/trees/mainline).
2. Remove the binary tags in the following files:
2. Open Koala and drag the styles folder into it.
3. Select all the .scss files, right-click, and choose compile.
4. Upload all the files to AWS in the cspreviewgen bucket. Mark the permissions as readable. Select all objects and then Click **More** and select **Make Public**. 
5. Copy over the assets.yml file into the \_data folder in the Appstore-alexa-docs-gitfarm folder.
5. Run `jekyll serve` on Appstore-alexa-docs-gitfarm.
6. Copy the contents from dexwebsitecollector.html in the root folder of the \_site output.
7. Paste contents of copy operation into \_layouts/dexwebsite.html.
8. Build your project with `jekyll serve --config _config_dex.yml`.

I haven't figured out how to pull in the sidebar yet....
