---
title: Using the LWA Web API
sidebar: dash_ja
permalink: dash-lwa-web-api.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

To access the Dash Replenishment Service (DRS) APIs, your web application needs to obtain a Login With Amazon (LWA) access token that grants access to the APIs on behalf of the product’s user.

Follow the instructions below to use the Login with Amazon web SDK to pass the Login with Amazon authorization code, client ID, and redirect URI to your web application. It can then use this data to obtain the access token needed to make calls to DRS REST APIs.

* TOC
{:toc}

## Types of Authorization

LWA supports two types of authorization: Implicit Grant and Authorization Code Grant. However, DRS requires the Authorization Code Grant.

## Create a Security Profile

1. Go to the [Login with Amazon console](https://developer.amazon.com/lwa/sp/overview.html) and select one of the security profiles. If you do not have a security profile, follow the steps in the [Create an LWA Security Profile][dash-create-a-security-profile] guide to create one.

2.  In the **Manage** section, under your security profile, select **Web Settings**.

    {% include image.html url="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/dex/dash/drs-securityprofile.png" file="dash/images/drs-securityprofile" type="png" alt="LWA Security Profile" %}

3.  Click on the **Edit** button and fill in the *Allowed Origins* and the *Allowed Returns URLs* fields. These must match the domain hosting your website (for example, `http://www.example.com` and `http://www.example.com/login`).

    {% include image.html url="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/dex/dash/drs-securityprofile2.png" file="dash/images/drs-securityprofile2" type="png" alt="LWA Security Profile" %}

## Integrate with the LWA SDK for JavaScript

The Login with Amazon SDK for JavaScript handles all aspects of integrating Login with Amazon into your website.

1.  Add the following code to your website where you would like the Login With Amazon button to appear. You can select from a variety of buttons and choose the image that best fits your website. See the [Login with Amazon Style Guidelines](https://login.amazon.com/style-guide) for best practices and a list of images to choose from. For the purposes of this guide, this must be an HTTPS website:

    ```html
    <a href="#" id="LoginWithAmazon">
    <img border="0" alt="Login with Amazon"
       src="https://images-na.ssl-images-amazon.com/images/G/01/lwa/btnLWA_gold_156x32.png"
       width="156" height="32" />
    </a>
    ```

2.  (Optional) Add the following link to your website where you would like a "Logout" prompt to appear:

    ```html
    <a id="Logout">Logout</a>
    ```

3.  Refresh the page to confirm that the button now appears on your website.
4.  Add the following code after the opening `<body>` in your page to load the JavaScript into your page:

    ```html
    <div id="amazon-root"></div>
    <script type="text/javascript">
    window.onAmazonLoginReady = function() {
          amazon.Login.setClientId('YOUR-CLIENT-ID');
      };
      (function(d) {
          var a = d.createElement('script');
          a.type = 'text/javascript';
          a.async = true;
          a.id = 'amazon-login-sdk';
          a.src = 'https://api-cdn.amazon.com/sdk/login1.js';
          d.getElementById('amazon-root').appendChild(a);
      })(document);
    </script>
    ```

5.  Replace `YOUR-CLIENT-ID` with your Client ID from the Security Profile created previously in the [Login With
Amazon console](https://developer.amazon.com/lwa/sp/overview.html).

    {% include image.html url="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/dex/dash/drs-securityprofile3.png" file="dash/images/drs-securityprofile3" type="png" alt="LWA Security Profile" %}

6.  Add the following JavaScript after the Login with Amazon button on your site:

    ```js
    <script type="text/javascript">
    document.getElementById('LoginWithAmazon').onclick = function() {
        var deviceModel = 'YOUR-DEVICE-MODEL-ID';
        var serialNo = 'YOUR-DEVICE-SERIAL-NO';
        var drsScope = 'dash:replenish';
        var scopeData = new Object();
        scopeData[drsScope] = {
            device_model: deviceModel,
            serial: serialNo
        };
        var options = {
            scope: drsScope,
            scope_data: scopeData,
            response_type: 'code'
        };
        amazon.Login.authorize(options, 'REDIRECT-URI');
        return false;
    };
    </script>
    ```

    * Replace `YOUR-DEVICE-MODEL-ID` with the device model ID for your device. The device type ID
    was specified as part of the device registration process on the [Amazon developer portal](https://developer.amazon.com/dash-replenishment/index.html).
    * Replace `YOUR-DEVICE-SERIAL-NO` with the key that uniquely identifies the instance of a product.
    For example, this could be a serial number or MAC address. **Note:** The device model ID and
    device serial must not exceed 64 characters and must use the following character set: [A-Z],
    [a-z], [0-9], "-", "+", "\_".
    * Replace `REDIRECT-URI` with one of the **Allowed Return URLs**, added to the security profile you created
    previously.
7.  (Optional) If desired, add `should_include_non_live` to the `scopeData[drsScope]` object. Include this parameter with a value of `true` to allow the registration to proceed using device capabilities that have not yet been marked as **live**. You can use this to test your integration while awaiting certification. This flag **must not** be passed in by your released app in production.

    ```js
    <script type="text/javascript">
    document.getElementById('LoginWithAmazon').onclick = function() {
        var deviceModel = 'YOUR-DEVICE-MODEL-ID';
        var serialNo = 'YOUR-DEVICE-SERIAL-NO';
        var drsScope = 'dash:replenish';
        var scopeData = new Object();
        scopeData[drsScope] = {
            device_model: deviceModel,
            serial: serialNo,
            should_include_non_live: true
        };
        var options = {
            scope: drsScope,
            scope_data: scopeData,
            response_type: 'code'
        };
        amazon.Login.authorize(options, 'REDIRECT-URI');
        return false;
    };
    </script>
    ```

7. Refresh the page and click on the **Login With Amazon** button to authenticate.

## Obtain Refresh and Access Tokens using Authorization Code Grant

After the user is authenticated, the user is redirected to the URI that you replaced with the `REDIRECT-URI`
placeholder in the previous section.

**Sample Authorization Code Grant Response**

```
https://www.example.com/login?code=ANdNAVhyhqirUelHGEHA&scope=dash:replenish
```

Next, your service leverages the returned authorization code to ask for an access token.

*  Send a `POST` request to `https://api.amazon.com/auth/o2/token` with the following parameters:

**HTTP Header Parameters**
    * `Content-Type: application/x-www-form-urlencoded`

**HTTP Body Parameters**
    * `grant_type`: `authorization_code`
    * `code`: The authorization code that was returned in the response.
    * `client_id`: The website’s client ID. This information can be found on the Amazon
    developer portal’s Login With Amazon page.
    * `client_secret`: The website’s client secret. This information can be found on the
    Amazon developer portal’s [Login With Amazon](https://developer.amazon.com/lwa/sp/overview.html) page.
    * `redirect_uri`: Should match one of the **Allowed Return URLs**, added to the security
    profile created previously.

**Sample Request**

```
POST /auth/o2/token HTTP/1.1
Host: api.amazon.com
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache
grant_type=authorization_code&code=ANBzsjhYZmNCTeAszagk&client_id=amzn1.application-oa2-
client.b91a4d2fd2f64&client_secret=6963038c1c2063c33ab9eedc0cf8&redirect_uri=https%3A%2F%2Flocalhost
```

**Sample Response**

```json
HTTP/1.1 200 OK
{
   "access_token": "Atza|IQEBLjAsAhRBejiZKPfn5HO2562GBt26qt23EA",
   "expires_in": 3600,
   "refresh_token": "Atzr|IQEBLzAtAhUAibmh-1N0EsdqwqwdqdasdvferrE",
   "token_type": "bearer"
}
```

Transfer the refresh token and access token to your user’s product.

## Request New Refresh and Access Tokens

The access token is valid for one hour. When the access token expires, or is about to expire, you can exchange the refresh token for a new access token.

* Send a `POST` request to `https://api.amazon.com/auth/o2/token` with the following parameters:

**HTTP Header Parameters**

* `Content-Type: application/x-www-form-urlencoded`

**HTTP Body Parameters**

* `grant_type`: `refresh_token`
* `refresh_token`: The refresh token used to request new access tokens.
* `client_id`: The website’s client ID. This information can be found on the Amazon
developer portal’s [Login With Amazon](https://developer.amazon.com/lwa/sp/overview.html) page.
* `client_secret`: The website’s client secret. This information can be found on the
Amazon developer portal’s [Login With Amazon](https://developer.amazon.com/lwa/sp/overview.html) page.
* `redirect_uri`: One of the return URIs that you added to your app’s security profile when
signing up.

**Sample Request**

```
POST /auth/o2/token HTTP/1.1
Host: api.amazon.com
Content-Type: application/x-www-form-urlencoded
Cache-Control: no-cache
grant_type=refresh_token&refresh_token=Atzr%7CIQEBLzAtAhUAibmh-1N0E&client_id=amzn1.application-oa2-
client.b91a4d2fd2f6&client_secret=6963038c1c2063c33ab9eedc0cf822
```

**Sample Response**

```json
HTTP/1.1 200 OK
{
   "access_token": "Atza|IQEBLjAsAhQ3yD47Jkj09BfU_qgNk4",
   "expires_in": 3600,
   "refresh_token": "Atzr|IQEBLzAtAhUAibmh-1N0EVztZJofMx",
   "token_type": "bearer"
}
```

## Call DRS APIs

It is now possible to call all DRS REST APIs. When making a request, add an Authorization header and give it the following value:

```
Bearer <access_token>
```

Use the `access_token` obtained previously.


{% include links.html %}
