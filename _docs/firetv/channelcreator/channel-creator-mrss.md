---
title: Use an Media RSS Feed to Configure Channel Creator
permalink: channel-creator-mrss.html
sidebar: channelcreator
product: Channel Creator
toc-style: kramdown
github: true
---

You can configure your Channel Creator app using a Media RSS (MRSS) feed as the source for your video content and details. With MRSS, you host the video on your own server and reference the MP4 files in your feed. Channel Creator will identify the necessary elements from your feed and use them to create the web app.

* TOC
{:toc}

## Sample Media RSS Feed {#samplemrssfeed}

Media RSS extends the RSS specification with some elements that are specific to media. These extensions are identified through the `media` namespace. You can view the MRSS specification [here](http://www.rssboard.org/media-rss). All of the elements listed in the specification are valid in your feed.

If you have iTunes elements (identified through the `itunes` namespace) in your MRSS feed, these elements are also valid.

Here's an example MRSS feed:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:atom="http://www.w3.org/2005/Atom" xmlns:media="http://search.yahoo.com/mrss/" version="2.0">
    <channel>
        <title>Calm Meditation</title>
        <link>http://idratherbewriting.com/calm-meditation</link>
        <language>en-us</language>
        <pubDate>Tue, 25 Apr 2017 17:26:11 +0000</pubDate>
        <lastBuildDate>Tue, 25 Apr 2017 17:26:11 +0000</lastBuildDate>
        <managingEditor>tom@idratherbewriting.com (Tom Johnson)</managingEditor>
        <description>Contains short videos capturing still scenes from nature with a music background, intended for calming or meditation purposes. When you're stressed out or upset, watch a few videos. As your mind focuses on the small details, let your worries and frustrations float away. The purpose is not to entertain or to distract, but to help calm, soothe, and surface your inner quiet. The videos contain scenes from the San Tomas Aquinas trail in Santa Clara, California.</description>
        <image>
            <link>http://idratherbewriting.com/calm-meditation</link>
            <title>Calm Meditation</title>
            <url>http://idratherbewriting.com/calm-meditation/images/calmmeditationlogo_small.png</url>
            <description>Contains short videos capturing still scenes from nature with a music background, intended for calming or meditation purposes. When you're stressed out or upset, watch a few videos. As your mind focuses on the small details, let your worries and frustrations float away. The purpose is not to entertain or to distract, but to help calm, soothe, and surface your inner quiet. The videos contain scenes from the San Tomas Aquinas trail in Santa Clara, California.</description>
            <height>114</height>
            <width>114</width>
        </image>
        <atom:link href="http://idratherbewriting.com/calm-meditation/feed.xml" rel="self" type="application/rss+xml" />
        <item>
            <title>Shade</title>
            <pubDate>Sun, 23 Apr 2017 00:00:00 +0000</pubDate>
            <link>http://idratherbewriting.com/calm-meditation/shade/</link>
            <description>Quiet the mind, and the soul will speak. - Ma Jaya Sati Bhagavati</description>
            <guid isPermaLink="false">http://idratherbewriting.com/calm-meditation/shade/</guid>
            <media:category>Trail</media:category>
            <media:content url="http://idratherassets.com/calm-meditation/shade.mp4" fileSize="37000000" type="video/mpeg" height="1280" width="720" duration="120.0" medium="video" isDefault="true">
                <media:title type="plain">Shade</media:title>
                <media:description type="html">Quiet the mind, and the soul will speak. - Ma Jaya Sati Bhagavati</media:description>
                <media:thumbnail url="http://idratherbewriting.com/calm-meditation/images/thumbs/shade.png" width="300" height="300" />
                <media:credit role="author" scheme="urn:ebu">Tom Johnson</media:credit>
                <media:copyright url="https://creativecommons.org/licenses/by/4.0/">Creative Commons (CC BY 4.0)</media:copyright>
            </media:content>
        </item>
        <item>
            <title>Perspective</title>
            <pubDate>Sun, 23 Apr 2017 00:00:00 +0000</pubDate>
            <link>http://idratherbewriting.com/calm-meditation/perspective/</link>
            <description>"Whatever has the nature of arising has the nature of ceasing." The Buddha</description>
            <guid isPermaLink="false">http://idratherbewriting.com/calm-meditation/perspective/</guid>
            <media:category>Building</media:category>
            <media:content url="http://idratherassets.com/calm-meditation/perspective.mp4" fileSize="25000000" type="video/mpeg" height="1280" width="720" duration="120.0" medium="video" isDefault="true">
                <media:title type="plain">Perspective</media:title>
                <media:description type="html">"Whatever has the nature of arising has the nature of ceasing." The Buddha</media:description>
                <media:thumbnail url="http://idratherbewriting.com/calm-meditation/images/thumbs/perspective.png" width="300" height="300" />
                <media:credit role="author" scheme="urn:ebu">Tom Johnson</media:credit>
                <media:copyright url="https://creativecommons.org/licenses/by/4.0/">Creative Commons (CC BY 4.0)</media:copyright>
            </media:content>
        </item>
    </channel>
</rss>
```

This MRSS feed has just two items in it, each identified through the `item` element.

When you insert the URL to your MRSS feed into Channel Creator, it reads the elements and attempts to map them to different elements in the web app. In some cases (for example, with `media:credit role="author"`), you may need to select from a drop-down menu to identify how the elements should be mapped.

Not all of the elements in an MRSS feed are actually used in the web app. Specifically, only the elements matched when Channel Creator validates your feed are used.

## Size of thumbnails in the feed


{% include links.html %}
