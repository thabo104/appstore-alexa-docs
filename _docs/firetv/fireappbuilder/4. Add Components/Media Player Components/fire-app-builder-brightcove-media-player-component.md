---
title: Brightcove Media Player Component
permalink: fire-app-builder-brightcove-media-player-component.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
published: false
---

By default the Amazon Media Player is configured in Fire App Builder. However, if you have a specific need to use the BrightCove Media Player, you can also choose to use this media player instead. There aren't any feature differences between the two. If your media or app infrastructure is coupled closely with BrightCove, you can simply choose to load it instead of Amazon Media Player.

When the user clicks the Watch Now button on the Content Renderer screen, the BrightCove Media Player plays the content:

## Configure the BrightCove Media Player

There aren’t any options to customize the BrightCove Media Player Component. You simply load the component following the general instructions here: [Add or Remove a Component][fire-app-builder-load-a-component]

You most likely already have the Amazon Media Player Component (AMZNMediaPlayerComponen) loaded in your app. You must remove this component from your app to load the BrightCove Media Player. See [Add or Remove a Component][fire-app-builder-load-a-component] for details.

{% include_relative componentnote_mediaplayer.html %}

{% include links.html %}
