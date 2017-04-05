---
title: Download Fire App Builder and Build an App
permalink: fire-app-builder-download-and-build.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

To build the sample app with Fire App Builder, complete the instructions in the following sections:

* TOC
{:toc}

## Step 1. Clone the Fire App Builder Project {#clone}

Fire App Builder is available in a Github repository ([https://github.com/amzn/fire-app-builder](https://github.com/amzn/fire-app-builder)) that you can download or clone. Cloning a repo allows you to get updates from the repository when they become available.

To clone the repo:

1.  Get [git](https://git-scm.com/downloads), if you don't already have it.
2.  If you use Windows, configure git to allow symbolic links (symlinks):

    ```bash
    git config –global core.symlinks true
    ```

    {% include warning.html content="On Windows, if you clone the repo without git's symbolic linking configured to `true`, Fire App Builder won't build." %}

3.  Go to [https://github.com/amzn/fire-app-builder](https://github.com/amzn/fire-app-builder).
4.  Click **Clone or Download**, and then copy the clone URL: `https://github.com/amzn/fire-app-builder.git`
5.  Open your command line and browse to a convenient directory for the project.
6.  Clone the project:

    ```
    git clone https://github.com/amzn/fire-app-builder.git
    ```

    git is initialized in a directory called fire-app-builder and the Fire App Builder project is downloaded.

    {% include tip.html content="If you want to clone the repo into an existing (empty) folder, first browse to the folder on the command line and then run `git clone https://github.com/amzn/fire-app-builder.git .` to copy the repo into the existing folder. Or `git clone https://github.com/amzn/fire-app-builder.git myspecialfolder` to download the project into a folder called `myspecialfolder`." %}

## Step 2. Set Up the JDK {#jdk}

You need the Java Development Kit (JDK) from Oracle to compile Java apps on your machine.

First check to see if you already have the JDK. Open Terminal or Command Prompt and type `java -version`. If you have the JDK, the response should be something like this:

```
java version "1.8.0_121"
Java(TM) SE Runtime Environment (build 1.8.0_121-b13)
Java HotSpot(TM) 64-Bit Server VM (build 25.121-b13, mixed mode
```

On Windows you can also manually look in a directory such as `C:\Program Files\Java\jdk1.8.0\` to see if the JDK is there.

If you don't have the JDK, download the appropriate version of the JDK Installer for your machine from [Java SE Development Kit Downloads](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) and run it.

For more details, see the following:

* **Mac**: [10 JDK 8 Installation for OS X](https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html#CHDBADCG)
* **Windows**: [JDK Installation for Microsoft Windows](https://docs.oracle.com/javase/8/docs/technotes/guides/install/windows_jdk_install.html). (Specifically, see "Running the JDK Installer" and "Updating the PATH Environment Variable.")
* For other operating systems and information, see [JDK 8 and JRE 8 Installation Start Here](https://docs.oracle.com/javase/8/docs/technotes/guides/install/install_overview.html).

## Step 3. Install Android Studio and the Necessary Tools and SDKs {#androidstudio}

To work with Fire App Builder, you need to install [Android Studio](https://developer.android.com/studio/index.html), the official IDE for Android projects.

See [Getting Started with Android Studio](https://developer.android.com/sdk/installing/studio.html) and [Install Android Studio](https://developer.android.com/sdk/installing/index.html) for information about setting up the Android Studio development environment on your machine.

The Fire App Builder project requires you to have certain SDK tools and APIs installed with Android Studio. Selecting these tools from the Standalone SDK Manager ahead of time isn't necessary. When you open the Fire App Builder project (as described in the next section, [Open the Sample App](#openFireAppBuilder)), Android Studio will prompt you to install any build tools or APIs that you're missing. For example, you might see messages such as the following:

{% include image.html file="firetv/fireappbuilder/images/fireappbuilder_sdktoolsneeded" max-width="70%" type="png" border="true" %}

Or you may see the following in the Gradle Console:

{% include image.html file="firetv/fireappbuilder/images/fireappbuilder_androidprompts"  max-width="70%" type="png" %}

If you see these messages, click these links to install the missing tools. Simply keep opening the project and installing any missing tools as prompted until Android Studio no longer complains.

You can also open the Standalone SDK Manager and install all the tool and SDK requirements ahead of time. To install the necessary SDKs and tools:

1.  Go to **Tools > Android > SDK Manager** (or simply click the **SDK Manager** button {% include inline_image.html file="firetv/fireappbuilder/images/fireappbuilder_androidsdkmanagericon" type="png" %}).
2.  On the **SDK Tools** tab, expand **Android SDK Build-Tools** and select the following:
    *  24.0.1
    *  24.0.3
    *  25.0.0
    *  25.0.2
3.  Expand **LLDB** and select the following:
    *  Android Emulator
    *  Android SDK Platform-Tools
    * Android SDK Tools
4.  Expand **Support Repository** and select the following:
    * Android Support Repository
    * Google Repository
5.  After selecting the check boxes, click the **Apply** button.

## Step 4. Open the Sample App {#openFireAppBuilder}

{% include warning.html content="In this section, you must allow about 30-40 minutes for Android Studio to download and build the app the first time." %}

In this step, you will open the "Application" project from Fire App Builder in Android Studio and build the app:

1.  Start **Android Studio**.
2.  At the Welcome screen, click **Open an existing Android Studio project**.

    {% include image.html file="firetv/fireappbuilder/images/fireappbuilder_androidstudiowelcome" type="png" max-width="75%" %}

    Note that if you don't see this welcome screen with these specific options, you probably haven't configured Android Studio with the JDK or any Android SDKs.

3.  Inside the Fire App Builder project folder, select the **Application** folder, and then click **OK**.

    {% include image.html file="firetv/fireappbuilder/images/fireappbuilder_androidstudioproject" type="png" max-width="75%" %}

    Depending on the latest release of Gradle, you may be prompted to update Gradle. If prompted, click **Don't remind me again for this project.**

    Gradle starts importing and building the project.

    {% include note.html content=" The first time you open the project, it can take **anywhere from 20-40 minutes** for Gradle to build the project, depending on the assets Gradle needs to download as well as your network and processor speed. Subsequent times should take about a minute or less. While you're waiting, consider [taking an app tour][fire-app-builder-app-tour] to become familiar with the app, and also consider exploring the Settings options on your Fire TV device." %}

4.  Open the Gradle Console by clicking **Gradle Console** in the lower-right corner so you can monitor the progress of the Gradle Build. This will let you know if the build succeeds or if Android Studio requires other downloads. Wait until Gradle finishes building.

    If Android Studio highlights any missing libraries or SDKs, follow the prompts to download and fix the issues.

    When finished, you should see a message in the Gradle Console that says `BUILD SUCCESSFUL`. When Gradle finishes building the project, Android Studio will show the following directories *in the Android view*:

    {% include image.html file="firetv/fireappbuilder/images/fireappbuilder_androidstudiosampledir" max-width="70%" type="png" alt="Android Studio directories" %}

    When Android opens the project, by default the [Android view](http://developer.android.com/sdk/installing/studio-androidview.html) is shown (circled in red in the previous screenshot), and the "Application" folder is simply referred to as "app." The Android view flattens the project's files and displays the most commonly used files into a more usable arrangement, but the actual structure of the files differs on your computer disk. (The "Project" view will show you the actual arrangement of all the folders and files.)

    {% include note.html content="Unless otherwise specified, this documentation refers to locations of files using the **Android view**." %}

5.  Connect your computer to your Fire TV device following the instructions in [Connecting to Fire TV Through ADB][fire-app-builder-connecting-adb-to-fire-tv].
4.  Click the **Run 'app'** button {% include inline_image.html alt="Run 'app' button" file="firetv/fireappbuilder/images/fireappbuilder_runappbutton" type="png" %}.
6.  In the Select Deployment Target dialog box, select **Amazon**, and then click **OK**.

    {% include image.html max-width="75%" alt="Emulator or Device Selection." file="firetv/fireappbuilder/images/fireappbuilder_aftsoptions" type="png" %}

    In the Select Deployment Target dialog box, AFTS refers to Amazon Fire TV (Generation 2). If you have the stick, it will say AFTT (Generation 2) or AFTM (Generation 1).

    {% include tip.html content="If you don't see the Amazon option, you haven't [connected your computer to the Fire TV device through ADB][fire-app-builder-connecting-adb-to-fire-tv]. If you don't have a Fire TV, there is limited support for [using an emulator][fire-app-builder-use-an-android-tv-emulator]." %}

    When the app builds successfully, your Fire TV device will load the application. See [Take an App Tour][fire-app-builder-app-tour] provides a screen-by-screen walkthrough of the app.

    If you run into build failure, you can try cleaning and rebuilding the project (**Build > Clean Project or Build > Rebuild Project**).

    If you close the app on your Fire TV, you can relaunch it using the Fire TV UI by going to **Settings > Applications > Manage Installed Applications > Fire App Builder** with your remote control.

    Note that ADB builds the app on your connected device in a *temporary* folder. When you disconnect your device, the app will no longer be available on the Fire TV. If you want to permanently install the app onto your Fire TV, you will need to sideload the app onto your device. See [Installing and Running Your App][installing-and-running-your-app].  

## Next Steps

Now that you've built and customized the default app in Fire App Builder, see [Take an App Tour][fire-app-builder-app-tour] to get more familiar with what Fire App Builder offers.

{% include links.html %}
