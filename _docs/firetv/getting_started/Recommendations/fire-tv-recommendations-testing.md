---
title: Test Your Recommendations
permalink: fire-tv-recommendations-testing.html
sidebar: firetv
product: Fire TV
reviewers: Murtaza, Dongjune
toc: false
wiki_pages:
- https://wiki.labcollab.net/confluence/display/DEVTECH/ReYA+Test+Plan
- https://wiki.labcollab.net/confluence/display/DEVTECH/Shared+Recommendations+Test+Plan
github: true
---

You can test your recommendations through options on the Developer Options Menu. The following steps walk you through this process.

**To test your recommendations:**

1.  Activate the Developer Tools Menu using either of the following options:

    *   [Amazon Remote Control][amazon-fire-tv-remote-input]: On the directional pad, press and hold the **center** and **down** together for 5 seconds. Then press the remote's **Menu** button.
    *   [Amazon Game Controller][amazon-fire-game-controller-input]: Press and hold **A** and **Y** buttons together for 5 seconds. Then press the controller's **menu** button.

2.  Slide the **Developer Options** to **On**. Then slide the **Developer Row** to **On**:

    {% include image.html file="firetv/getting_started/images/devoptionsdeveloperrow" type="png" max-width="350px" %}

3.  Select the **Shared Recommendation Developer Row** package.

    {% include image.html file="firetv/getting_started/images/selectpackage" type="png" max-width="500px" %}

4.  Restart your Fire TV by going go to **Settings > Device > Restart**.
5.  Open your app and stream content for several minutes.

It takes some time for the Fire TV home screen to refresh and pick up the recommendations. After streaming content from the apps, wait about 5 minutes. Then navigate around a bit -- go from the home screen to **Settings**, wait a few seconds, then go back to **Settings**.

Soon you will see a new row appear on the home screen called "Recommendation Testing Row." This row will appear below Netflix or HBO Go rows, if you have the Netflix or HBO Go apps. (Otherwise it appears directly below "Featured Apps & Games" row.)

{% include image.html file="firetv/getting_started/images/recommendationrowappears" type="png" %}

## Next steps

To learn more, see the following:

* [Recommendations Overview][fire-tv-recommendations-overview]
* [Send Recommendations that Include Amazon Extras][fire-tv-recommendations-send-recommendations]
* [Best Practices for Recommendations][fire-tv-recommendations-best-practices]

{% include links.html %}
