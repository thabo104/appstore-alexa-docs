---
title: Recommendations FAQ
permalink: fire-tv-recommendations-faq.html
sidebar: firetv
product: Fire TV
toc-style: kramdown
github: true
---

The following are some frequently asked questions about recommendations.

Q: When does the "Recommended By Your Apps" row appear?
:  There are two requirements: (1) an app must broadcast recommendations and (2) there must be at least 5 recommendations to display. One or more apps can broadcast recommendations, but in order for the Recommended By Your Apps row to appear, there must at least be five recommendations in total.

Q: Can you share any information about the sorting of content when multiple apps use recommendations?
:  We have a simple algorithm to start. We will update the algorithm as we develop better app ranking based on usage.

Q: If multiple apps have recommendations, how do they display? For example, suppose two apps (A and B) have 5 recommendations, each ranked as 1, 2, 3, 4, 5. Will the sorting be A1, B1, A2, B2, A3, B3, etc?
:  Not exactly. The first recommendation from each app will be listed first (A1, B1, C1, ... n1). Apps will be listed in the order recommendations are received. Then the second recommendation and all further recommendations from each app will be random.

Q: What happens if an app uses the extra rank and ranks all of its content as 1?
:  We are currently not using recommendation ranks. The ranking information will be used for future enhancements.

Q: Will all recommendations by an app always show up in the Recommended by your Apps row? Is there a total limit, across all apps?
:  We have a limit of 100 recommendations total (an app has an Android limit of 50 recommendations).  After that, there is an internal algorithm for trimming extra recommendations (recency, etc.).

Q: Do we (or will we) track the click-through rate (CTR) of users selecting to watch content in this row?
:  CTR metrics will not be available in the current release. However, this is in on the roadmap. Developers can track this themselves by adding an EXTRA in the pending intent.

Q: For the `setGenre` API, the documentation mentions that this content is used for ranking. Although not mandatory, it sounds like this may affect ranking. Should we include `setGenre`?
:  The genre information may be used for future enhancements.

Q: Are there limitations to the type of content that we can include? Clips? Live content? Audio only?
:  There aren't any restrictions. 

Q: How does mature content or parental control affect the Recommended By Your Apps row?
:  Enabling any viewing restrictions under Parental Controls setting will suppress the Recommended By Your Apps row, regardless of maturity ratings. It is on the roadmap to keep the row visible and display recommendations with appropriate maturity ratings.
