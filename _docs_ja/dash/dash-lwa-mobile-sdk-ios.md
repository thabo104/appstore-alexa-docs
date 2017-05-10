---
title: Use Login with Amazon SDK with iOS
sidebar: dash_ja
permalink: dash-lwa-mobile-sdk-ios.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

Follow the instructions below to use Login with Amazon SDK for iOS to pass a Login with Amazon (LWA) authorization code to your product. Your product can use this authorization code to obtain refresh and access tokens needed to make calls to DRS.

* TOC
{:toc}

## LWA Version Note

Note that in this documentation, we are using [LWA version 3.0.1](https://developer.amazon.com/public/apis/engage/login-with-amazon/docs/release_notes.html). You can check the LWA version by adding the following line of code in the `viewDidLoad` method:

```objective_c
NSLog(@"LWA version: %@", [AMZNLWASDKInfo sdkVersion]);
```

The output should look similar to this:

```bash
2017-02-09 18:19:53.680040 test[1805:822020] LWA version: 3.0.1
```

## Get the Authorization Code and Make Calls to DRS on iOS:

1.  Navigate to Login with Amazon [Getting Started for iOS](http://login.amazon.com/ios) and complete steps 1, 2, 3, 4, and 5.
2.  Obtain a new API key from the Security Profiles console. If you do not have a Security Profile, follow the steps in the [Create an LWA Security Profile][dash-create-a-security-profile] guide to create one.
3.  In the **Manage** drop-down menu, select **iOS** settings.

    {% include image.html file="dash/images/dash-lwaios" type="png" %}

4.  In the **Manage** drop-down menu, select **iOS settings**.
5.  Provide your **API key name** and a **Bundle ID**.
6.  Click **Show** under the **Key** column to see your API key.

    {% include image.html file="dash/images/dash-api-key" type="png" %}

7.  Copy the new API key to your application **Info.plist** file.

8. Add the following #import statement to your source file to import the Login with Amazon API:

    ```objective_c
    #import <LoginWithAmazon/LoginWithAmazon.h>;
    ```

9.  Add the function that will perform the login:

    ```objective_c
    - (void)login
      {
          AMZNAuthorizationManager* manager = [AMZNAuthorizationManager sharedManager];
          AMZNAuthorizeRequest* request = [[AMZNAuthorizeRequest alloc] init];
          request.interactiveStrategy = AMZNInteractiveStrategyAuto;
          NSMutableArray* scopeObjectArray = [NSMutableArray array];
          NSString* requestScopes = @"dash:replenish";
          NSMutableDictionary* options = NSMutableDictionary.new;
          //DEVICE_SERIAL_NUMBER – The serial number of the device you are trying to register
          options[@"serial"] = @"DEVICE_SERIAL_NUMBER";
          //Set device model name. This is a "Device Model ID" in the Self Service portal.
          options[@"device_model"] = @"DEVICE_MODEL_NAME";
          //Set whether this registration should allow marketplaces that have not yet been certified.  For use in pre-release testing only, this flag must not be passed in by your released app in production.
    options[@"should_include_non_live"] = false;

          // IS_THIS_A_TEST_DEVICE - Flag that indicates if this a test device or not. Test devices will
          not place actual orders.

              option[@"is_test_device"]
              = @”IS_THIS_A_TEST_DEVICE”

              id<AMZNScope> drsScope = [AMZNScopeFactory scopeWithName:requestScopes data:options];
          [scopeObjectArray addObject:drsScope];
          request.scopes = scopeObjectArray;
          request.grantType = AMZNAuthorizationGrantTypeCode;
          // Set your code challenge.
          request.codeChallenge = @"YOUR_CODE_CHALLENGE";
          // Set code challenge method - "plain" or "S256".
          request.codeChallengeMethod = @"YOUR_CODE_CHALLENGE_METHOD";
          [manager authorize:request withHandler:[self requestLoginHandler]];
      }
      - (AMZNAuthorizationRequestHandler)requestLoginHandler
      {
          AMZNAuthorizationRequestHandler requestHandler = ^(AMZNAuthorizeResult* result, BOOL userDidCancel, NSError* error) {
              if (error) {
                  NSString* errorMessage = error.userInfo[@"AMZNLWAErrorNonLocalizedDescription"];
                  NSLog(@"Error: %@", errorMessage);
                  //handle login error
              }
              else if (userDidCancel) {
                  //handle user cancellation
              }
              else {
                  // Authentication was successful. Obtain the user profile data.
                  NSString* authCode = result.authorizationCode;
                  NSString* clientId = result.clientId;
                  NSString* redirectUri = result.redirectUri;
                  NSLog(@"\n code = %@ \n client ID = %@ \n redirect URI = %@", authCode, clientId, redirectUri);
                  //request the access and the refresh token
              }
          };
          return [requestHandler copy]
      }
    ```

    You have completed the necessary preparation to make a POST request call to obtain the access and refresh tokens. The following steps will walk you through the process of making this call. This call can be made from your mobile application or DRS product. (In this documentation, we assume you will make that call on your DRS product.)

10.   Securely transfer the authorization code, client ID, and redirect URI to your product using SSL.
11.  After the authorization code, client ID, and redirect URI are received on the product, the product can call Login with Amazon to exchange the authorization code for the access and refresh tokens.

     When making the call, the product needs to send a POST request to `https://api.amazon.com/auth/O2/token` and pass in the following parameters:

     * `grant_type`: The authorization code string.
     * `code`: The authorization code string received from the iOS app.
     * `redirect_uri`: The redirect URI string received from the iOS app.
     * `client_id`: The client ID string received from the iOS app.
     * `code_verifier`: The code verifier string that was initially generated by the product.

     **Sample Curl Request:**

     ```
     curl –X POST –d 'code=YOUR-AUTHORIZATION-CODE&client_id=YOUR-CLIENT-ID&redirect_uri=YOUR-REDIRECT-URI&code_verifier=YOUR-CODE-VERIFIER&grant_type=authorization_code' https://api.amazon.com/auth/O2/token
     ```

     The response includes the following values:

     * `access_token`: The access token string.
     * `refresh_token`: The refresh token string.
     * `token_type`: The token type string.
     * `expires_in`: The number of seconds for which the access token is still valid.

     **Sample Curl Response**:

     ```json
     {
        "access_token":"YOUR-ACCESS-TOKEN",
        "refresh_token":"YOUR-REFRESH-TOKEN",
        "token_type":"bearer",
        "expires_in":3573
     }
     ```

{% include links.html %}
