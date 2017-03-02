---
title: AudioLanguage
bookmark: AudioLanguage
description: >
  An audio option for the work when that work has been dubbed into additional languages. You can include as many AudioLanguage elements as needed to specify the work's available alternatives.

attributes: >

   <table class="grid">
   <colgroup>
      <col width="30%" />
      <col width="70%" />
   </colgroup>
   <thead>
      <tr>
         <th>Detail</th>
         <th>Description</th>
      </tr>
   </thead>
      <tbody>
        <tr>
          <td>Added</td>
          <td>CDF version 1.0</td>
      </tr>
      <tr>
          <td>Parent Elements</td>
          <td><a href="#LaunchDetails">LaunchDetails</a></td>
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
          <td>Standard XML/HTML language codes, such as en, en-US, fr, or fr-FR</td>
        </tr>
      </tbody>
    </table>

example: >

  <LaunchDetails>
    <Quality>SD</Quality>
    <Quality>HD</Quality>
    <AudioLanguage>en-US</AudioLanguage>
    <AudioLanguage>es-MX</AudioLanguage>
    <Subtitle>en-US</Subtitle>
    <Subtitle>es-MX</Subtitle>
    <LaunchId>MV123456_HD_es-MX_en</LaunchId>
  </LaunchDetails>
---
