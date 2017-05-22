---
layout: none
---

1.  Get the latest assets from [DeXWebsiteAUIAssets](https://code.amazon.com/packages/DeXWebsiteAUIAssets/trees/mainline). Run `git clone ssh://git.amazon.com/pkg/DeXWebsiteAUIAssets` to get a copy of the latest files.
2.  Remove the binary tags by searching through the files for "binary:" (limited by \*.scss file type). Also remove `$DeXWebsiteAUIAssets-iconmoon-woff format('woff');`.
3.  Open Koala and drag the styles folder into it.
4.  Select all the .scss files, right-click, and choose **Compile**. This processes the .scss into .css files.
5.  Upload the entire **DeXWebsiteAUIAssets** folder to AWS in the **cspreviewgen** bucket. Select **Read** permissions on upload for other users and groups.
6.  After the folder uploads, select the check box next to the **DeXWebsiteAUIAssets** folder. Then from **More** menu, select **Make Public**.
7.  Copy over the **assets.yml** file from **DeXWebsiteAUIAssets** into the **\_data** folder in the Appstore-alexa-docs-gitfarm folder.
8.  Run `jekyll build` on Appstore-alexa-docs-gitfarm.
9.  Copy the contents from **dexwebsitecollector.html** in the root folder of the **\_site** output.
10. Paste contents of copy operation into **\_layouts/dexwebsite.html** in the source of the project.
11. Build your project with `jekyll serve --config _config_dex.yml`. The \_site folder contains the output.
