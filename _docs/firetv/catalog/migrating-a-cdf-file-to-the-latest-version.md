---
title: Migrating a Catalog Data Format (CDF) File to the Latest Version
permalink: migrating-a-cdf-file-to-the-latest-version.html
sidebar: catalog
product: Fire TV Catalog
toc-style: kramdown
github: true
---

This page describes changes involved in each version of the Fire TV CDF schema beginning with v1.0, and gives a series of steps to follow to update a catalog file to the latest version.


* TOC
{:toc}

## Migration Overview

Amazon Fire TV occasionally updates its Catalog Data Format (CDF) XML schema to accept new metadata, remove unused information, or clarify the catalog structure. These changes do not cause existing CDF files to become invalid, but some data in older tags might be ignored or used in new ways, and deprecation warnings will appear in the [ingestion report][receiving-and-understanding-the-catalog-ingestion-report].

In the future, Amazon could potentially stop supporting older schemas. For the best customer experience, Amazon recommends always creating your catalog file against the latest CDF schema version.

How and where you make these changes depends on how you create your catalog file. If you have code that pulls the information from a database and transforms it into a CDF file, you'll need to change the transformation code. If your database is structured to match the CDF, you'll need to alter the fields of the database itself.

Upgrade your CDF file in stages (v1.0 to v1.1, v1.1 to v1.2, etc.), accounting for each version change in turn. It is a linear progression that varies only in where you start. If you don't know which CDF version your file uses, start from the beginning. The changes between versions are mostly additions of new optional elements, so simply adapting your current file <span></span>as-is to a new schema version requires very few alterations, generally just one or two per version.

Some XML elements must be placed in your catalog file in a specific order defined by the CDF XSD file. An element that's out of order makes the catalog file invalid. Refer to the appropriate XSD file if you have any question about element order.

*   [CDF XSD Version 1.0](https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-10.xsd)
*   [CDF XSD Version 1.1](https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-11.xsd)
*   [CDF XSD Version 1.2](https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-12.xsd)
*   [CDF XSD Version 1.3](https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-13.xsd)

Also look at the downloadable [example CDF files (ZIP)](https://s3.amazonaws.com/com.amazon.aftb.cdf/cdf-examples.zip).

This topic assumes that you are familiar with XML and the [CDF schema][about-the-cdf].

## Migrating from CDF v1.0 to v1.1

Here are the differences between CDF v1.0 and v1.1:

<table>
<colgroup>
   <col width="20%" />
   <col width="15%" />
  <col width="15%" />
  <col width="50%" />
</colgroup>
  <thead>
    <tr>
      <th>Item</th>
      <th>Type</th>
      <th>Change</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>WorkType.Source</code></td>
      <td>Element</td>
      <td>Added</td>
      <td>Optional. Specifies the origin of the work. Accepted values are: <ul>
      <li><b><code>original</code></b>: A work produced by your company. For example, Amazon would specify this value for the Amazon original series Transparent.</li>
      <li><b><code>licensed</code></b>: A work that your company licensed from another source.</li>
      <li><b><code>other</code></b>: The original source is known, but can’t be classified as <code>original</code> or <code>licensed</code>.</li>
      <li><b><code>unknown</code></b>: The original source is not known.</li>
      </ul></td>
    </tr>
    <tr>
      <td><code>WorkType.AdultProduct</code></td>
      <td>Element</td>
      <td>Deprecated</td>
      <td>This value is no longer used and the element should be removed. Adult content can be identified through the ContentRatings element. In Japan, you can use the <code class="highlighter-rouge">JP_Require18PlusAge</code><br /><code class="highlighter-rouge">Confirmation</code> element added in v1.2.</td>
    </tr>
  </tbody>
</table>

### To update a CDF file from v1.0 to v1.1

1.  Remove all instances of _WorkType_.AdultProduct.
2.  Optional: Add the Source element to all work elements (Movie, TvShow, TvEpisode, TvSpecial, TvSeason, MiniSeries, MiniSeriesEpisode, and Extra). Placement of the Source element varies by work type; see the XSD for correct placement.

## Migrating from CDF v1.1 to v1.2

Here are the differences between CDF v1.1 and v1.2:

<table>
<colgroup>
   <col width="20%" />
   <col width="15%" />
  <col width="15%" />
  <col width="50%" />
</colgroup>
  <tbody>
    <tr>
      <td>Item</td>
      <td>Type</td>
      <td>Change</td>
      <td>Notes</td>
    </tr>
    <tr>
      <td><code>Catalog.version</code></td>
      <td>Attribute</td>
      <td>Added</td>
      <td>Optional. Use this attribute so that others who work with the file will know which CDF version it was created against. Accepted values are <code>FireTv-v1.2</code> and <code>FireTv-v1.3</code></td>
    </tr>
    <tr>
      <td><em>OfferType</em>.LaunchDetails</td>
      <td>Element</td>
      <td>Added</td>
      <td>Optional. Includes these child elements in the given order.
      <ul>
      <li><b><code>Quality</code>:</b> Optional. This is the new location of the <em>OfferType</em>.Quality element used to specify video quality. It is otherwise identical to the older version. Accepted values are SD, HD, and UHD. </li>
      <li><b><code>AudioLanguage</code>:</b> Optional. A language option for the work’s original or dubbed audio.</li>
      <li><b><code>Subtitle</code>:</b> Optional. A language option for the work’s subtitles. </li>
      <li><b><code>LaunchId</code>:</b> Optional. An identifier used to launch this content with a specified quality, audio, and subtitle combination. This lets you use a single identifier for content that differs in audio encoding (dubbing), visual quality, and subtitle language, but otherwise shares the same metadata. There is no specific format to this string; it only needs to be understood by your app. <p>Each instance of LaunchDetails can contain as many Quality, AudioLanguage, and Subtitle elements as necessary, but only one LaunchId. To specify a different LaunchId, create another copy of the LaunchDetails element. See the example below.</p></li>
      </ul></td>
    </tr>
    <tr>
      <td><code>OfferType.Quality</code></td>
      <td>Element</td>
      <td>Deprecated/Moved</td>
      <td>This element is now a child element of <em>OfferType</em>.LaunchDetails (see above). It can be moved to the new location otherwise unchanged.</td>
    </tr>
    <tr>
      <td><code>CustomerRating.Count</code></td>
      <td>Element</td>
      <td>Added</td>
      <td>Optional. Allows you to specify the number of ratings from which the final rating was averaged. Placed as the last element under CustomerRating.</td>
    </tr>
    <tr>
      <td><code>JP_Require18PlusAgeConfirmation</code></td>
      <td>Element</td>
      <td>Added</td>
      <td>Optional. Only used by Japanese content providers. Accepted values are true and false. When true, viewers of this content in Japan are presented with a dialog in which they must confirm that their age is 18 or above, in accordance with Japanese law. This element should, at a minimum, be added it to those works that Japanese regulators regard as not to be viewed by anyone under 18. This element’s placement depends on the work type.</td>
    </tr>
    <tr>
      <td><code>CastMember.Role</code></td>
      <td>Element</td>
      <td>Now optional</td>
      <td>This element, which specifies the name of the character played by the cast member, was required in v1.1 but can now be omitted.</td>
    </tr>
  </tbody>
</table>

### To update a CDF file from v1.1 to v1.2

1.  For any SubscriptionOffer, FreeOffer, PurchaseOffer, or RentalOffer that includes a Quality element:
    1.  Add a LaunchDetails element as the last element in each offer.
    2.  Move the Quality element from its current location to the LaunchDetails element.

        Example:

        **Before**

        ```xml
        <FreeOffer>
           <Quality>HD</Quality>
                ...
         </FreeOffer>
        ```

        **After**

        ```xml
        <FreeOffer>
             ...
           <LaunchDetails>
              <Quality>HD</Quality>
            </LaunchDetails>
         </FreeOffer>
        ```

2.  Optional. For any SubscriptionOffer, FreeOffer, PurchaseOffer, or RentalOffer that didn't include a Quality element, add a LaunchDetails element as the last element for each. Add as much of the optional Quality, AudioLanguage, Subtitle, and LaunchId information as you have.

    **Example**:

    ```xml
    <FreeOffer>
            ...
            <LaunchDetails>
                <Quality>HD</Quality>
                <AudioLanguage>en-us</AudioLanguage>
                <Subtitle>en</Subtitle>
                <Subtitle>es</Subtitle>
                <LaunchId>tt123456_HD_en-us</LaunchId>
            </LaunchDetails>
            <LaunchDetails>
                <Quality>HD</Quality>
                <AudioLanguage>es-mx</AudioLanguage>
                <Subtitle>en</Subtitle>
                <Subtitle>es</Subtitle>
                <LaunchId>tt123456_HD_es-mx</LaunchId>
            </LaunchDetails>
        </FreeOffer>
    ```

3.  Optional, but recommended. Add the _version_ attribute, set to FireTv-v1.2, to the existing Catalog element at the top of your CDF file.

    **Example**:

    ```xml
    <Catalog xmlns="http://www.amazon.com/FireTv/2014-04-11/ingestion" version="FireTv-v1.2">
    ```

4.  Optional. If you have CustomerRating elements in your catalog, add a Count element as the last element in CustomerRating. This value should be updated whenever you update the CustomerRating.Score value. How you collect and track that information is up to you.
5.  Optional for providers of content to Fire TV in Japan. Add a JP_Require18PlusAgeConfirmation element to at least those works for which it is set to true. Consult the XSD file for the element's placement, as it varies by work type.

    **Example**:

    ```xml
    <Movie>
        ...
        <JP_Require18PlusAgeConfirmation>true</JP_Require18PlusAgeConfirmation>
        <ReleaseDate>1959-05-13T04:36:00</ReleaseDate>
    </Movie>
    ```

## Migrating from CDF v1.2 to v1.3

Here are the differences between CDF v1.2 and v1.3

<table>
<colgroup>
   <col width="20%" />
   <col width="15%" />
  <col width="15%" />
  <col width="50%" />
</colgroup>
  <thead>
    <tr>
      <th>Item</th>
      <th>Type</th>
      <th>Change</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>MiniSeries</td>
      <td>Element</td>
      <td>Added</td>
      <td>A mini-series is loosely defined as a TV show limited to a small number of ordered episodes, without seasons.</td>
    </tr>
    <tr>
      <td><code>MiniSeriesEpisode</td>
      <td>Element</td>
      <td>Added</td>
      <td>An individual episode in a mini-series, used in the same manner as a TvEpisode in relation to a TvShow.</td>
    </tr>
    <tr>
      <td><code><code>Extra</td>
      <td>Element</td>
      <td>Added</td>
      <td>Supplementary material, often to accompany a work. Accepted values are: <br /><br /><li><em>clip</em>: This can be anything from a short scene from the work to a documentary about the work’s cinematographer. Think of it as an bonus feature on a DVD. <br /><br /><li><em>trailer</em>: An official preview of the work or an associated work.</td>
    </tr>
    <tr>
      <td><code>ReleaseInfo</code></td>
      <td>Element</td>
      <td>Deprecated/Moved</td>
      <td>This element contained two child elements:
      <ul>
      <li>ReleaseCountry: This information is no longer used </li>
      <li>ReleaseDate: This information has been moved to these locations:  <code>WorkType.ReleaseDate</code> (for Movie, TvShow, and MiniSeries), and <code>WorkType.OriginalAirDate</code> (for <code>TvEpisode</code>, <code>TvSpecial</code>, and <code>MiniSeriesEpisode</code>). <p>Note that the original value was in the XML <code>date</code> format (YYYY-MM-DD) while the new values are in the <code>dateTime</code> format (YYYY-MM-DDThh:mm:ss). You cannot simply move the element into its new location; you must also update each value. Also, while <code>ReleaseInfo.ReleaseDate</code> was optional, <code>OriginalAirDate</code> for <code>TvSpecial</code> is required. The others remain optional.</p></li>
      </ul></td>
    </tr>
    <tr>
      <td><code>Movie.ReleaseDate</code></td>
      <td>Element</td>
      <td>Added</td>
      <td>Optional. This is the new location of the deprecated <code>Movie.ReleaseInfo.ReleaseDate</code>. See the <code>ReleaseInfo</code> entry above for details.</td>
    </tr>
    <tr>
      <td><code>TvShow.ReleaseDate</code></td>
      <td>Element</td>
      <td>Added</td>
      <td>Optional. This is the new location of the deprecated <code>TvShow.ReleaseInfo.ReleaseDate</code>. See the ReleaseInfo entry above for details.</td>
    </tr>
    <tr>
      <td><code>TvEpisode.OriginalAirDate</code></td>
      <td>Element</td>
      <td>Added</td>
      <td>Optional. This is the new location of the deprecated <code>TvEpisode.ReleaseInfo.ReleaseDate. See the <code>ReleaseInfo</code> entry above for details.</td>
    </tr>
    <tr>
      <td><code>TvSpecial.OriginalAirDate</code></td>
      <td>Element</td>
      <td>Added</td>
      <td>Required. This is the new location of the deprecated <code>TvSpecial.ReleaseInfo.ReleaseDate</code>. See the <code>ReleaseInfo</code> entry above for details.</td>
    </tr>
    <tr>
      <td><code>TvSpecial.ShowID</code></td>
      <td>Element</td>
      <td>Added</td>
      <td>Optional. This element allows you to attach a special to a specific show, in the situation where the special was an event outside of the regular run of a series. This value must match a <code>TvShow.ID</code> value in your catalog. You cannot include both this value and <code>TvSpecial.ShowTitle</code>.</td>
    </tr>
    <tr>
      <td><code>TvSpecial.ShowTitle</code></td>
      <td>Element</td>
      <td>Added</td>
      <td>Optional. This element allows you to attach a special to a show not included in your catalog. The ShowTitle string isn’t required to match any title in your catalog. It is used to create the illusion of an attachment without the underlying structure. Use this value <em>only</em> when you cannot use ShowID.</td>
    </tr>
    <tr>
      <td><code>Works</code></td>
      <td>Element</td>
      <td>Can now be empty</td>
      <td>Previously this would have caused your catalog to be invalid. Now, an empty Works element has the effect of removing all of your content from Amazon Fire TV’s universal browse and search.</td>
    </tr>
    <tr>
      <td><code>WorkType.ID</code></td>
      <td>Element</td>
      <td>Must now be at least one character in length</td>
      <td>The element itself (a unique identifier for each work) was always required, but now it requires a value as well. Given that this is an extremely important piece of information, used in everything from tying episodes to seasons and shows to reporting where to find an error in the file, it should always be present and unique.</td>
    </tr>
  </tbody>
</table>


### To update a CDF file from v1.2 to v1.3

1.  Move the _WorkType_.ReleaseInfo.ReleaseDate element for all works to their new location. Change each date value to the [XML _dateTime_ format](http://www.w3schools.com/schema/schema_dtypes_date.asp) (YYYY-MM-DDThh:mm:ss). If you don't know the specific time that a work was released or aired, you can just use T00:00:00 for that portion of the string. The target ReleaseDate and OriginalAirDate elements are the last elements in their respective work types.
    *   Movie.ReleaseInfo.ReleaseDate moves to Movie.ReleaseDate
    *   TvShow.ReleaseInfo.ReleaseDate moves to TvShow.ReleaseDate
    *   TvEpisode.ReleaseInfo.ReleaseDate moves to TvEpisode.OriginalAirDate
    *   TvSpecial.ReleaseInfo.ReleaseDate moves to TvSpecial.OriginalAirDate
    *   TvSeason.ReleaseInfo.ReleaseDate is no longer used so it requires no move

        Example:

        **Before**

        ```xml
        <Movie>
        <Movie>
            ...
            <ReleaseInfo>
                <ReleaseDate>1959-05-13</ReleaseDate>
            </ReleaseInfo>
            ...
         </Movie>
            ...
            <TvSpecial>
                ...
                <ReleaseInfo>
                    <ReleaseDate>1959-05-13</ReleaseDate>
                </ReleaseInfo>
                ...
            </TvSpecial>
        ```
         
        **After**

        ```xml
        <Movie>
            ...
            <ReleaseDate>1959-05-13T00:00:00</ReleaseDate>
        </Movie>
        ...
        <TvSpecial>
            ...
            <OriginalAirDate>1959-05-13T00:00:00</OriginalAirDate>
        </TvSpecial>
        ```

2.  Delete all instances of the `ReleaseInfo` element, including any `ReleaseDate` and `ReleaseCountry` elements that they contain.
3.  Ensure that you don't have any empty `WorkType.ID` elements (it's unlikely). If you do, assign those works a unique ID.

    Example:

    **Before**

    ```xml

    <TvShow>
        <ID></ID>
        ...
    </TvShow>
    ```

    **After**

    ```xml
    <TvShow>
      <ID>ts-123456</ID>
      ...
     </TvShow>
    ```

4.  Optional. If you have existing content that would be more accurately described as a `MiniSeries`, move that information into the new `MiniSeries` and `MiniSeriesEpisode` work types.
5.  Optional. If you have existing content that would be more accurately described as an `Extra`, move that information into the new `Extra` work type.
6.  Optional, but recommended. Add or update the `version` attribute found in the Catalog element at the top of your CDF file to `FireTv-v1.3`.

    Example:

    ```xml
    <Catalog xmlns="http://www.amazon.com/FireTv/2014-04-11/ingestion" version="FireTv-v1.3">
    ```

7.  Optional, but recommended where applicable. Add either a `ShowID` (preferred) or `ShowTitle` element to each `TvSpecial` to connect that special to a show. For those specials that are standalone works, these elements can be omitted.
8.  Optional. Add an OriginalAirDate element and value for each `TvSpecial` or `TvEpisode` that didn't have a `ReleaseInfo.ReleaseDate` element.
9.  Optional. Add a `ReleaseDate` element and value for each Movie or TvShow that didn't have a `ReleaseInfo.ReleaseDate` element.

{% include links.html %}
