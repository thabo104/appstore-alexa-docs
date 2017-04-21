---
title: Pull Updates from Github
permalink: fire-app-builder-pulling-updates-from-github.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

You can stay updated about the latest commits to Fire App Builder by watching and starring the project in Github. You can also periodically check the [Release Notes][fire-app-builder-release-notes] page in the documentation.

{% include note.html content="If this is the first time you're forking and building the project, see [Download Fire App Builder and Build an App][fire-app-builder-download-and-build] instead of this topic. (This topic addresses how to apply updates to an existing project.)" %}

* TOC
{:toc}

## Getting Updates

When new versions of Fire App Builder are released and pushed out to Github, you can get the new version's updates and integrate the code into your project.

1.  Follow the instructions in [Fork the Fire App Builder Repo][fire-app-builder-download-and-build#fork] to add the [amzn/fire-app-builder](https://github.com/amzn/fire-app-builder) repo as a [remote](https://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes) to your own GitHub repo.

    For example, you can add the add the [amzn/fire-app-builder](https://github.com/amzn/fire-app-builder) repo as a remote to your repo with the following command:

    ```
    git remote add amzn-fab https://github.com/amzn/fire-app-builder.git
    ```

    This adds a remote called "amzn-fab" to your repo. (You can use whatever name you want for the remote.)

2.  Pull the updates with the following command:

    ```
    git pull amzn-fab master
    ```

    (If you named your remote something other than amzn-fab, use that name instead.)

    You will see merge conflicts for any files with the same name in the amazon/fire-app-builder that you've customized in your own repo. For example, navigator.json.

3.  Follow standard Git practices for resolving merge conflicts. See [Resolving a merge conflict using the command line](https://help.github.com/articles/resolving-a-merge-conflict-using-the-command-line/).

    If changes in the original repository's files conflict with changes you've made to your local copy, git will not automatically overwrite your local copies with the updates. Instead, git will show you merge conflicts for the affected files and remove the affected files from its tracking. You will then need to resolve the merge conflicts, add the files back into git tracking, and commit your update.

    When you see merge conflicts, run `git status` to see a list of the problematic files. Open the files and look for the carrots (``>>>>>>``) and (``<<<<<<``) indicating areas of conflict. Manually edit the files to remove the carrots, selecting the changes you want to keep and deleting those you want to discard. Then add the file back into git tracking with `git add .`.

4.  When you're finished resolving conflicts, build your app to make sure everything works. Then push the changes into your own GitHub repo:

    ```
    git push
    ```

## Git Resources

Here are some good resources for learning git:

* [git's documentation](https://git-scm.com/doc)
* [git - the simple guide](http://rogerdudler.github.io/git-guide/)
* [git Tutorials from Atlassian](https://www.atlassian.com/git/tutorials/)

{% include links.html %}
