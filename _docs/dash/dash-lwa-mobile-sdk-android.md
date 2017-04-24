---
title: Use Login with Amazon SDK with Android
sidebar: dash
permalink: dash-lwa-mobile-sdk-android.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

Follow the instructions below to use the Login with Amazon SDK for Android to pass the Login with Amazon authorization code, client ID, and redirect URI to your product. Your product can then use this data to obtain the refresh and access tokens needed to make calls to DRS.

* TOC
{:toc}

## LWA Version Note

Note that in this documentation, we are using LWA version 3.0.0. You can check the LWA version by following the steps under [What version of the Login with Amazon SDK for Android is my app using][1].

The output should look similar to this:

```
LWA_VERSION = "3.0.0";
```

## Get the Authorization Code and Make Calls to DRS on Android

1.	Navigate to [Login with Amazon Getting Started for Android](http://login.amazon.com/android) and complete steps 1 through 3. After completing this, you will have a functional Android application with Login with Amazon integrated. To use LWA with DRS, you will need to make some small changes to your application described in the following steps.
2.	Obtain a new API key from the [Security Profiles](https://developer.amazon.com/iba-sp/overview.html) console. If you do not have a Security Profile, follow the steps in the [Create an LWA Security Profile](https://developer.amazon.com/public/solutions/devices/dash-replenishment-service/docs/dash-create-a-security-profile) guide to create one.
3.	In **Security Profile Management**, under your security profile, select **Android/Kindle Settings**.

    {% include image.html  file="dash/images/androidlwa-1" type="png" %}

4.	Fill in the required fields to register your application.
5.	Click **Show** under the **Key** column to see your API key.

    {% include image.html  file="dash/images/androidlwa-3" type="png" %}

6.	Copy the API key to your application’s **api_key.txt** file.
7.	Import the LWA API to your source file by adding the following statements:

    ```java
    import com.amazon.identity.auth.device.AuthError;
    import com.amazon.identity.auth.device.api.authorization.AuthCancellation;
    import com.amazon.identity.auth.device.api.authorization.AuthorizationManager;
    import com.amazon.identity.auth.device.api.authorization.AuthorizeListener;
    import com.amazon.identity.auth.device.api.authorization.AuthorizeRequest;
    import com.amazon.identity.auth.device.api.authorization.AuthorizeResult;
    import com.amazon.identity.auth.device.api.authorization.Scope;
    import com.amazon.identity.auth.device.api.authorization.ScopeFactory;
    import com.amazon.identity.auth.device.api.workflow.RequestContext;
    ```

8.	Declare the RequestContext object as the class variable and initialize it in the `onCreate()` method:

    ```java
    private RequestContext requestContext;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
     super.onCreate(savedInstanceState);
     requestContext = RequestContext.create(this);
    }
    ```

9.	Register a new `AuthorizeListener` to the `RequestContext` object:

    ```java
    requestContext.registerListener(new AuthorizeListener() {

     /* Authorization was completed successfully. */
     @Override
     public void onSuccess(final AuthorizeResult authorizeResult) {
      runOnUiThread(new Runnable() {
       @Override
       public void run() {
        Log.d(TAG, authorizeResult.getRedirectURI());
        Log.d(TAG, authorizeResult.getAuthorizationCode());
        Log.d(TAG, authorizeResult.getClientId());
       }
      });
     }

     /* There was an error during the attempt to authorize the application */
     @Override
     public void onError(AuthError authError) {
      runOnUiThread(new Runnable() {
       @Override
       public void run() {
        Log.e(TAG, "Error during authorization. Please try again.");
       }
      });
     }

     /* Authorization was cancelled before it could be completed. */
     @Override
     public void onCancel(AuthCancellation authCancellation) {
      runOnUiThread(new Runnable() {
       @Override
       public void run() {
        Log.i(TAG, "Authorization cancelled.");
       }
      });
     }
    });
    ```

    The methods `onSuccess()`, `onError()`, and `onCancel()` should contain the code with their respective login scenarios.

10.	Add the following code to the `onResume()` method:

    ```java
    @Override
    protected void onResume() {
     super.onResume();
     requestContext.onResume();
    }
    ```

11.	In other to perform the authorization, include the following lines in your application:

    ```java
    AuthorizationManager.authorize(
     new AuthorizeRequest.Builder(requestContext)
     .addScopes(YOUR-LOGIN-SCOPE)
     .forGrantType(AuthorizeRequest.GrantType.AUTHORIZATION_CODE)
     // Set your code challenge and code challenge method - "plain" or "S256".
     .withProofKeyParameters(YOUR_CODE_CHALLENGE,
      YOUR_CODE_CHALLENGE_METHOD)
     .build()
    )
    ```

    An example would be a login button:

    ```java
    /**
    * Initializes all of the UI elements in the activity.
    */
    private void initializeUI() {
        mLoginButton = findViewById(R.id.login_with_amazon);
        mLoginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Scope scope = getScope();
                if (scope != null) {
                    AuthorizationManager.authorize(
                            new AuthorizeRequest.Builder(requestContext)
                                    .addScopes(scope)
                                    .forGrantType(AuthorizeRequest.GrantType.AUTHORIZATION_CODE)
                                    // Set your code challenge and code challenge method - "plain" or "S256".
                                    .withProofKeyParameters(YOUR_CODE_CHALLENGE, YOUR_CODE_CHALLENGE_METHOD)
                                    .build()
                    );
                }
            }

        });
    }

    /**
    * Get the login scope.
    *
    * @return Scope.
    */
    private Scope getScope() {
      //YOUR_DEVICE_MODEL_NAME - The model ID of your device obtained from self-service portal.
      //YOUR_DEVICE_SERIAL_NUMBER – The serial number of the device you are trying to register.
      //IS_THIS_A_TEST_DEVICE – Flag that indicates if this a test device or not. Test devices will not place actual orders.
      //SHOULD_INCLUDE_NON_LIVE – Flag that indicates if this registration should allow marketplaces that have not yet been certified. For use in pre-release testing only, this flag must not be passed in by your released app in production.
        final String scopeDataString = "{\"device_model\":\"" + YOUR_DEVICE_MODEL_NAME +
                "\", \"serial\":\"" + YOUR_DEVICE_SERIAL_NUMBER +
                "\", \"is_test_device\":\"" + IS_THIS_A_TEST_DEVICE +
                "\", \"should_include_non_live\":\"" + SHOULD_INCLUDE_NON_LIVE +
                "\"}";
        JSONObject scopeData;
        try {
            scopeData = new JSONObject(scopeDataString);
            return ScopeFactory.scopeNamed("dash:replenish", scopeData);
        } catch (JSONException e) {
            Log.e(TAG, "Error during scope data JSON object creation", e);
        }
        return null;
    }
    ```

    You have completed the necessary preparation to make a POST request call to obtain the access and refresh tokens.

    The following steps will walk you through the process of making this call. This call can be made from your mobile application or DRS product or by your backend solutions. (In this documentation, we assume you will make that call on your DRS product.)

12.	After a successful login, the `AuthorizeListener onSuccess()` method is called. You should obtain the authorization code, client ID, and redirect URI and securely transfer them to your product using SSL.
13.	After the authorization code, client ID, and redirect URI are received on the product, the product can call Login with Amazon to exchange the authorization code for the access and refresh tokens.

When making the call, the product needs to send a POST request to `https://api.amazon.com/auth/O2/token` and pass in the following parameters:

*  `grant_type`: The authorization code string.
*  `code`: The authorization code string received from the Android application.
*  `redirect_uri`: The redirect URI string received from the Android application.
*  `client_id`: The client ID string received from the Android application.
*  `code_verifier`: The code verifier string that was initially generated by the product.

**Sample Curl Request:**

```curl
curl –X POST –d 'code=YOUR-AUTHORIZATION-CODE&client_id=YOUR-CLIENT-ID&redirect_uri=YOUR-REDIRECT-URI&code_verifier=YOUR-CODE-VERIFIER&grant_type=authorization_code' https://api.amazon.com/auth/O2/token
```

The response includes the following values:

*  `access_token`: The access token string.
*  `refresh_token`: The refresh token string.
*  `token_type`: The token type string.
*  `expires_in`: The number of seconds for which the access token is still valid.

**Sample Curl Response:**

```json
{
   "access_token":"YOUR-ACCESS-TOKEN",
   "refresh_token":"YOUR-REFRESH-TOKEN",
   "token_type":"bearer",
   "expires_in":3573
}
```


[1]: https://developer.amazon.com/public/apis/engage/login-with-amazon/docs/upgrade_android_sdk

{% include links.html %}
