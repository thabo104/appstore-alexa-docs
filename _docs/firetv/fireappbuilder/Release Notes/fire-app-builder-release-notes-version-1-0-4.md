---
title: Version 1.0.4 Release Notes
permalink: fire-app-builder-release-notes-version-1-0-4.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

Version 1.0.4 was released on May 2, 2017.

## Bug Fixes

* **Playing next and recommended videos from logged out users**. For apps requiring user login prior to showing media, when users logged out, they could still play next and recommended videos. This issue has been fixed.
* **VAST ads not playing consistently**. For for apps that have the [VAST ads component][fire-app-builder-vast-ads-component] configured, ads were not playing consistently at the beginning of media. This issue has been fixed.
* **In-app purchases tag automatically applied to app submissions**. When apps were submitted to the Appstore, the presence of the IAP component triggered the Appstore to automatically include an in-app purchases tag on apps, even if apps didn't have the IAP component active. This issue has been fixed.

See [Known Issues][fire-app-builder-known-issues] for a list of known bugs.

{% include tip.html content="See [Pull Updates from Github][fire-app-builder-pulling-updates-from-github] for details on how to get the latest changes into your own repo." %}

{% include links.html %}
