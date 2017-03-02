---
title: AdultProduct (deprecated)
bookmark: AdultProduct
description: >
  **Deprecated, do not use**. Use a [ContentRating](#ContentRating) to convey this information instead. In Japan, you can also use [JP_Require18PlusAgeConfirmation](#JP_Require18PlusAgeConfirmation) (CDF v1.2 and later).

  Identifies a work as content for adult audiences only.

attributes: >

  <table>
  <tbody>
    <tr>
      <td>Added</td>
      <td>CDF version 1.0</td>
    </tr>
    <tr>
      <td>Deprecated</td>
      <td>CDF version 1.1</td>
    </tr>
    <tr>
      <td>Parent Elements</td>
      <td><a href="#Movie">Movie</a>, <a href="#TvShow">TvShow</a>, <a href="#TvSeason">TvSeason</a>, <a href="#TvEpisode">TvEpisode</a>, <a href="#TvSpecial">TvSpecial</a>, <a href="#MiniSeries">MiniSeries</a>, <a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>, <a href="#Extra">Extra</a></td>
    </tr>
    <tr>
      <td>Child Elements</td>
      <td>None</td>
    </tr>
    <tr>
      <td>Attributes</td>
      <td>None</td>
    </tr>
    <tr>
      <td>Accepted values</td>
      <td>true <br /> false</td>
    </tr>
  </tbody>
  </table>

example: >

  <Movie>false</Movie>
    ...
    <AdultProduct>false</AdultProduct>
    ...
  </Movie>false</Movie>

---
