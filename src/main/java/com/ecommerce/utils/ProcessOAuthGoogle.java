package com.ecommerce.utils;

import com.ecommerce.DTO.UserGoogleDTO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;

public class ProcessOAuthGoogle {
    /*
        Due to security reason, I have to hide client id and client secret key and "login/register with Google" feature is not available,
        if you want to test this feature, please contact me to get these keys:
        email: ducldc@jsclub.dev or ducldche176120@fpt.edu.vn
        */
    public static String getToken(String code, String redirect_url) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(GoogleConstants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", GoogleConstants.GOOGLE_CLIENT_ID)
                        .add("client_secret", GoogleConstants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", redirect_url).add("code", code)
                        .add("grant_type", GoogleConstants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        System.out.println(jobj);
        return jobj.get("access_token").toString().replaceAll("\"", "");
    }

    public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = GoogleConstants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        return new Gson().fromJson(response, UserGoogleDTO.class);
    }
}
