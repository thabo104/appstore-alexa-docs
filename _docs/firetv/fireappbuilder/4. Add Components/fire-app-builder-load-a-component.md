---
title: Load a Component in Your App
permalink: fire-app-builder-load-a-component.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

For an overview of the available components, see [Components Overview][fire-app-builder-interfaces-and-components]. Although documentation for each component is specific, you load all components in the same way.

* TOC
{:toc}

## Remove a Component {#removeacomponent}

With the exception of analytics components, you can load only one component per interface. For example, you cannot load both the VAST Ads component and the Freewheel Ads component, because both components use the same `IAds` interface.

However, all components require you to have a component loaded in your app for that interface. Because of this requirement, some components are dummy components that simply fulfill the requirements of having a component. The following are dummy components:

*  LoggerAnalyticsComponent
*  PassThroughAdsComponent

These dummy components don't do anything. For a list of the component interface groups, see [Available Components and Interfaces][fire-app-builder-interfaces-and-components#componentgroups] in Components Overview.

Before you load a component in your app, check to make sure you have only one component for that interface. If another component is already loaded (as is probably the case, even if it's just a dummy component) you must remove it.

To remove a component from your app, follow the same steps as listed in the next section, "Load a Component in Your App," but do the opposite in each step. For example, instead of adding a reference to something like `FacebookAuthComponent`, you would remove the reference.

## Load a Component in Your App {#loadcomponent}

To load a component in your app:

*  [1. Define and Compile the Component](#define)
*  [2. Configure the Component's Values](#configure)

### 1. Define and Compile the Component {#define}

{% include note.html content="These instructions assume you're in the Android view." %}

First you need to first define the implemented components in the "settings.gradle (Project Settings)" file:

1.  In Android Studio, in the Android view, expand **Gradle Scripts** and open the **settings.gradle (Project Settings)** file. (This file appears near the bottom of the list.)
2.  In the two **Implementations** sections, list the components that you want (just one component for each interface).

    In settings.gradle (Project Settings), there are three places to list the components. The areas are identified through the `/* Implementations */` comments, which are set off in <span class="red">red</span> here:

    <pre>
    include ':app',
        /* Frameworks */
        ':TVUIComponent',
        ':UAMP',
        /* Libraries */
        ':ContentModel',
        ':ContentBrowser',
        ':DynamicParser',
        ':DataLoader',
        ':Utils',
        /* Interfaces */
        ':PurchaseInterface',
        ':AuthInterface',
        ':AdsInterface',
        ':AnalyticsInterface',
        ':ModuleInterface',
        <span class="red">/* Implementations */</span>
        ':PassThroughAdsComponent',
        ':AMZNMediaPlayerComponent',
        ':FlurryAnalyticsComponent',
        ':LoginWithAmazonComponent',
        ':AmazonInAppPurchaseComponent'

    /* Frameworks */
    project(':TVUIComponent').projectDir = new File(rootProject.projectDir, '../TVUIComponent/lib')
    project(':UAMP').projectDir = new File(rootProject.projectDir, '../UAMP')

    /* Libraries */
    project(':ContentModel').projectDir = new File(rootProject.projectDir, '../ContentModel')
    project(':ContentBrowser').projectDir = new File(rootProject.projectDir, '../ContentBrowser')
    project(':DynamicParser').projectDir = new File(rootProject.projectDir, '../DynamicParser')
    project(':DataLoader').projectDir = new File(rootProject.projectDir, '../DataLoader')
    project(':Utils').projectDir = new File(rootProject.projectDir, '../Utils')

    /* Interfaces */
    project(':ModuleInterface').projectDir = new File(rootProject.projectDir, '../ModuleInterface')
    project(':AdsInterface').projectDir = new File(rootProject.projectDir, '../AdsInterface')
    project(':AuthInterface').projectDir = new File(rootProject.projectDir, '../AuthInterface')
    project(':AnalyticsInterface').projectDir = new File(rootProject.projectDir, '../AnalyticsInterface')
    project(':PurchaseInterface').projectDir = new File(rootProject.projectDir, '../PurchaseInterface')

    <span class="red">/* Implementations */</span>
    project(':AMZNMediaPlayerComponent').projectDir = new File(rootProject.projectDir, '../AMZNMediaPlayerComponent')
    project(':PassThroughAdsComponent').projectDir = new File(rootProject.projectDir, '../PassThroughAdsComponent')
    project(':FlurryAnalyticsComponent').projectDir = new File(rootProject.projectDir, '../FlurryAnalyticsComponent')
    project(':FacebookAuthComponent').projectDir = new File(rootProject.projectDir, '../FacebookAuthComponent')
    project(':AmazonInAppPurchaseComponent').projectDir = new File(rootProject.projectDir, '../AmazonInAppPurchaseComponent')
    </pre>

    For the component names, use the component folder name:

    *  AdobepassAuthComponent
    *  FacebookAuthComponent
    *  LoginWithAmazonComponent
    *  FlurryAnalyticsComponent
    *  OmnitureAnalyticsComponent
    *  CrashlyticsComponent
    *  GoogleAnalyticsComponent
    *  FreeWheelAdsComponent
    *  VastAdsComponent
    *  AmazonInAppPurchasingComponent
    *  AMZNMediaPlayerComponent
{% comment %}*  BrightCoveMediaPlayerComponent {% endcomment %}

    In the the sample app in Fire App Builder, the following components are implemented by default: AMZNMediaPlayerComponent, PassThroughAdsComponent, LoggerAnalyticsComponent, PassThroughLoginComponent, and AmazonInAppPurchaseComponent.

4.  Adjust the implementations by adding or removing the components you want to use in your app. Be sure to make the updates in both places that <span class="red">`/*Implementations*/`</span> is mentioned.
5.  You can implement only one component per interface, so remove any previous components for the same interface. For example, if you added the LoginWithAmazonComponent, which implements the `IAuthentication` interface, you must remove any other authentication components (such as AdobepassAuthComponent or FacebookAuthComponent).
6.  Expand **Gradle Scripts** and open the **build.gradle (Module: app)** file.
7.  In the **dependencies** object, include the components you want to include in your app.

    By default, Fire App Builder shows these components:

    ```java
    compile project(':TVUIComponent')
    compile project(':UAMP')
    compile project(':AMZNMediaPlayerComponent')
    compile project(':PassThroughAdsComponent')
    compile project(':PassThroughLoginComponent')
    compile project(':AmazonInAppPurchaseComponent')
    compile project(':LoggerAnalyticsComponent')
    ```

    Add or remove the components you want to implement following the same pattern as before.

5.  Resync your project with Gradle by clicking the **Resync Project with Gradle Files** button {% include inline_image.html file="firetv/fireappbuilder/images/fireappbuilder_syncgradlebutton" type="png" %}.

    If you're prompted that some modules are no longer imported from Gradle anymore, click **OK**.

    {% include image.html file="firetv/fireappbuilder/images/gradlemoduleprompt" type="png" %}

    When the project syncs, you will see the new components reflected in the Project pane.

6.  You can remove old build artifacts from previous components by going to **Build > Rebuild Project** .

### 2. Configure the Component's Values {#configure}

Each component has a list of customizable strings that have been extracted out into an XML file. Because of this, to customize a component with your app, you merely need supply the right values for the strings. You don't need to modify the Java classes.

However, different components may require a little more setup than others, especially because they usually involve implementing and setting up a third-party service. Because of this, see the documentation for each component for the specifics of how to configure the component:

*  [AdobepassAuthComponent][fire-app-builder-adobe-pass-auth-component]
*  [FacebookAuthComponent][fire-app-builder-facebook-auth-component]
*  [LoginWithAmazonComponent][fire-app-builder-login-with-amazon-component]
*  [FlurryAnalyticsComponent][fire-app-builder-flurry-analytics-component]
*  [OmnitureAnalyticsComponent][fire-app-builder-omniture-analytics-component]
*  [CrashlyticsComponent][fire-app-builder-crashlytics-component]
*  [GoogleAnalyticsComponent][fire-app-builder-google-analytics-component]
*  [FreeWheelAdsComponent][fire-app-builder-freewheel-ads-component]
*  [VastAdsComponent][fire-app-builder-vast-ads-component]
*  [AmazonInAppPurchasingComponent][fire-app-builder-amazon-in-app-purchase-component]
*  [AMZNMediaPlayerComponent][fire-app-builder-amazon-media-player-component]
{% comment %}*  [BrightCoveMediaPlayerComponent][fire-app-builder-brightcove-media-player-component]{% endcomment %}

The strings that have been extracted for each component are the most common parameters only. If you need an additional feature within the component that hasn't been extracted out into a string, you will need to customize it in the component's class that implements the interface.

The XML files for each component are usually located in the component's **res > values** folder.

{% include image.html file="firetv/fireappbuilder/images/fireappbuilder_stringcustomization" type="png" caption="The most common values that you would need to customize for each component are extracted out into XML files." %}

{% include note.html content="Instead of customizing the values directly in the component's files, copy the strings into your **app**'s custom.xml file instead. Any settings in your app's custom.xml file will overwrite the XML file values in the components. This will allow you to incorporate updates to the component when new releases are available." %}

{% include links.html %}
