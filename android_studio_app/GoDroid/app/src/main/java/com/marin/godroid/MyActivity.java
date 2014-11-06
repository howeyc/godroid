package com.marin.godroid;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import go.Go;
import go.godroid.Godroid;


public class MyActivity extends Activity {

    WebView browser;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.web_view);

        //Magic
        Go.init(getApplicationContext());

        Godroid.Start();

        browser = (WebView)findViewById(R.id.browser);
        browser.setWebViewClient(new WebViewClient());
        browser.loadUrl("http://localhost:8080");
    }
}
