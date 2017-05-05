---
title: Recommendations FAQ
permalink: fire-tv-recommendations-faq.html
sidebar: firetv
product: Fire TV
toc-style: kramdown
github: true
---

Additionally, here are FAQs we have in our internal KB, some of them may be relevant for a public facing FAQ:

Q: When does the "Recommended By Your Apps" row appear?
:  There are two requirements: (1) an app must broadcast recommendations and (2) there must be at least 5 recommendations to display. One or more apps can be broadcasting recommendations, but in order for the Recommended By Your Apps row to appear, there must at least be five recommendations in total.

Q: Can you share any information about the sorting of content when multiple apps are using recommendations?
:  We have a simple algorithm to start.  We don’t have reliable app ranking yet, and will change the algorithm as we develop better app ranking.

Q: If multiple apps have recommendations, how do they display? For example, suppose two apps (A and B) have 5 recommendations, each ranked as 1, 2, 3, 4, 5. Will the sorting be A1, B1, A2, B2, A3, B3, etc?
:  Not exactly. The first recommendation from each app will be listed first (A1, B1, C1,… n1). Apps will be listed in the order received. Then the second recommendation and all further recommendations from each app will be random.

Q: What happens if an app uses the extra rank and ranks all of its content as 1?
:  This scenario has not been explored.

Q: Would all recommendations by an app always show up in the Recommended by your Apps row? Is there a total limit, across all apps?
:  We have a limit of 100 recommendations total (an app has an Android limit of 50 recommendations).  After that, there is an internal algorithm for trimming extra recommendations (recency, etc.).

Q: Do we (or will we) track the click-through rate (CTR) of users selecting to watch content in this row?
:  Click-through-rate metrics will not be available in the current release. However, this is in on the roadmap. Developers can track this themselves by adding an EXTRA in the pending intent.

Q: For the `setGenre` API, the documentation mentions this content is used for ranking. Although not mandatory, it sounds like this may affect ranking. Should we include it?
:  This information may be used for future enhancements.

Q: Are there any limitations to the type of content that we are restricting against including? Clips? Live Content? Audio only?
:  There aren't any restrictions, but audio is not yet supported. This will be available in an upcoming release.

Q: How does mature content or parental control affect the Recommended By Your Apps row?
:  Enabling any Viewing Restrictions under Parental Controls setting will suppress the Recommended By Your Apps row, regardless of maturity ratings. It is on the roadmap to keep the row visible and display recommendations with appropriate maturity ratings.

Q: Will Amazon apps (such as Amazon Music) have access to the Recommended By Your Apps row?
:  Yes, but they will not have preferential treatment.
