package com.ecommerce.utils;

public class GoogleConstants {
        /*
        Due to security reason, I have to hide client id and client secret key and "login/register with Google" feature is not available,
        if you want to test this feature, please contact me to get these keys:
        email: ducldc@jsclub.dev or ducldche176120@fpt.edu.vn
        */
    public static String GOOGLE_CLIENT_ID = "";
    public static String GOOGLE_CLIENT_SECRET = "";

    public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/eCommerceProject/login-google";

    public static String GOOGLE_REDIRECT_URI_2 = "http://localhost:8080/eCommerceProject/register-google";

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
