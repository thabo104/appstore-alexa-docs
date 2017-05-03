---
title: Version 1.0.3 Release Notes
permalink: fire-app-builder-release-notes-version-1-0-3.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

Version 1.0.3 was released on April 14, 2017.

## Bug Fixes

* **App doesn't crash with invalid feed objects.** If your media feed has an invalid object, such as a bad media URL, the app will no longer crash. Instead, the app will skip the item and note the problem in the logs.
* **Fixed analytics tracking for ACTION_PLAYBACK_FINISHED events.** In the analytics components, the ACTION_PLAYBACK_FINISHED event was incorrectly configured. As a result, the action was tracked twice. This is now fixed.  

See [Known Issues][fire-app-builder-known-issues] for a list of known bugs.

{% include tip.html content="See [Pull Updates from Github][fire-app-builder-pulling-updates-from-github] for details on how to get the latest changes into your own repo." %}

{% include links.html %}
