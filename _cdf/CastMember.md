---
title: CastMember
bookmark: CastMember
description: >
  Provides information about a person in the work's cast, such as an actor, host, narrator, or voice talent. When present, the optional [Credits](#Credits) element must include at least one entry, either a CastMember or a [CrewMember](#CrewMember). You can include as many CastMember elements as needed.

  **Required if no CrewMember element is present, otherwise optional:**

attributes: >
  <table>
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
      <td><a href="#Credits">Credits</a></td>
    </tr>
    <tr>
      <td>Child Elements</td>
      <td><a href="#Name">Name</a> (required), <a href="#ExternalID">ExternalID</a> (optional), <a href="#Role">Role</a> (optional)</td>
    </tr>
    <tr>
      <td>Attributes</td>
      <td>None</td>
    </tr>
  </tbody>
  </table>
example: >
  <Credits>
    <CastMember>
      <Name locale="en-US">Alan Smithee</Name>
      <ExternalID scheme="imdb">tt0000000</ExternalID>
      <Role locale="en-US">Self</Role>
    </CastMember>
  </Credits>
---
