{% include note.html content ="\"Used\" (the column on the far right) indicates whether Fire TV currently makes use of this data in the Fire TV recommendations display on the home screen. Even if an extra isn't used now, it may be used in the future with upcoming Fire TV releases." %}

<table class="grid">
   <colgroup>
   <col width="30%" />
   <col width="10%" />
   <col width="50%" />
   <col width="10%" />
   </colgroup>
   <thead>
      <tr>
         <th>Extra name</th>
         <th>Data type</th>
         <th>Details</th>
         <th>Used</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td><code>com.amazon.extra.DISPLAY_NAME</code></td>
         <td>String</td>
         <td>A shorter app name displayed in the Launch menu (which appears when you press the <b>menu</b> button while a recommendation is selected). The length limit is 15 characters. Additional characters are truncated without showing an ellipses for the truncated characters.</td>
         <td>Yes</td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.MATURITY_RATING</code></td>
         <td>String</td>
         <td>Displays the rating below the title. The rating is also used by the Parental Control settings on Fire TV to determine if content playback needs to be behind a PIN. Any recommendation without this extra or without a value for <code>setMaturityRating()</code> will be treated as Mature content and may require a PIN subject to the Parental Control settings on the device.
            <p>Currently, supported values are as follows:</p>
            <ul>
            <li><b>US Marketplace:</b> <code>G</code>, <code>PG</code>, <code>PG13</code>, <code>R</code>, <code>NC17</code>, <code>NR</code>, <code>TVY</code>, <code>TVY7</code>, <code>TVG</code>, <code>TVPG</code>, <code>TV14</code>, <code>TVMA</code></li>
            <li><b>German Marketplace:</b> <code>FSK0</code>, <code>FSK6</code>, <code>FSK12</code>, <code>FSK16</code>, <code>FSK18</code></li>
            <li><b>Great Britain Marketplace:</b> <code>BBFCPG</code>, <code>BBFC12</code>, <code>BBFC18</code>, <code>BBFCU</code></li>
            <li><b>Japan Marketplace:</b> <code>EIRIN_G</code>, <code>EIRIN_PG12</code>, <code>EIRIN_R15</code>, <code>EIRIN_18</code></li>
            </ul>
            </td>
            <td>Yes</td>
      </tr>
      <tr>
               <td><code>com.amazon.extra.RANK</code></td>
               <td>int</td>
               <td>Specifies the app's preferred ordering of recommendations. Fire TV's selection algorithm selects recommendations with lower rank numbers more often than higher numbers. Note that there is no guarantee for the sort order of recommendations displayed from different apps.</td>
               <td>No</td>
            </tr>
            <tr>
               <td><code>com.amazon.extra.ACTIONS</code></td>
               <td>ArrayList&lt;int&gt;</td>
               <td>Determines the context menu options displayed for each recommendation. Two context menu actions are supported, but only the first action is configurable. <p>When users click a recommendation tile or its first context menu option, Fire TV uses the corresponding content intent data passed with recommendation to launch the app.</p>
                <p>Possible values to include are as follows:</p>
                   <ul>
                   <li><code>1</code>: Watch with <code>&lt;App name&gt;</code></li>
                   <li><code>101</code>: Watch</li>
                   <li><code>2</code>: Resume with <code>&lt;App name&gt;</code></li>
                   <li><code>102</code>: Resume</li>
                   <li><code>3</code>: Switch <code>&lt;App name&gt;</code> Profile</li>
                   <li><code>4</code>: Change <code>&lt;App name&gt;</code> Settings</li>
                   <li><code>104</code>: Change Settings</li>
                   <li><code>5</code>: View with <code>&lt;App name&gt;</code></li>
                   <li><code>105</code>: View</li>
                   <li><code>6</code>: Play with <code>&lt;App name&gt;</code></li>
                   <li><code>106</code>: Play</li>
                   <li><code>7</code>: Listen with <code>&lt;App name&gt;</code></li>
                   <li><code>107</code>: Listen</li>
                   </ul>
                   <p>If no value is provided, the default action will be <code>Open</code> and below that, <code>Launch &lt;App Name&gt;</code>.</p>
              </td>
              <td>Yes</td>  
            </tr>
      <tr>
         <td><code>com.amazon.extra.LIVE_CONTENT</code></td>
         <td>int</td>
         <td>Helps determine whether a recommendation is live content and needs to be displayed or hidden based on <code>CONTENT_START_TIME</code> and <code>CONTENT_END_TIME</code>. Supported values are as follows:
             <ul>
             <li><code>0</code>: Not a Live content</li>
             <li><code>1</code>: Live Content</li>
            </ul>
            <td>No</td>
          </td>
        </tr>
      <tr>
         <td><code>com.amazon.extra.CONTENT_RELEASE_DATE</code></td>
         <td>String</td>
         <td>Content release year. Example: 2016, 2015, 1977 etc.</td>
         <td>No</td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.CONTENT_CAPTION_AVAILABILITY</code></td>
         <td>Array of strings</td>
         <td>Caption availability of content.
             <ul>
             <li><b>0</b>: Caption not available for content</li>
             <li><b>1</b>: Caption available for content</li>
             </ul>
             <td>No</td>
             </td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.IMDB_ID</code></td>
         <td>String</td>
         <td>IMDB ID of content.
         </td>
         <td>No</td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.CONTENT_START_TIME</code></td>
         <td>long</td>
         <td>Start time of live content in milliseconds (EPOCH).
         </td>
         <td>No</td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.CONTENT_END_TIME</code></td>
         <td>long</td>
         <td>End time of live content in milliseconds (EPOCH).</td>
         <td>No</td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.TEXT_EMBEDDED_IMAGE</code></td>
         <td>int</td>
         <td>Whether recommendation image has text embedded on it.
             <ul>
             <li>0: Text not embedded</li>
             <li>1: Text embedded</li>
        </ul>
        <td>No</td>
        </td>
      </tr>
      <tr>
        <td><code>com.amazon.extra.LONG_DESCRIPTION</code></td>
        <td>String</td>
        <td>Long description of a recommendation. Length is limited to 512 characters.</td>
        <td>No</td>
      </tr>
      <tr>
        <td><code>com.amazon.extra.LAST_WATCHED_DATETIME</code></td>
        <td>long</td>
        <td>Last watched time of the recommended content in milliseconds (EPOCH). </td>
        <td>No</td>
      </tr>
      <tr>
        <td><code>com.amazon.extra.PREVIEW_URL</code></td>
        <td>String</td>
        <td>Preview video or image URL for the recommendation.</td>
        <td>No</td>
      </tr>
   </tbody>
</table>
