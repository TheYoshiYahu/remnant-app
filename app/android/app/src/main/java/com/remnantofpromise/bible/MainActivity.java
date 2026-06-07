package com.remnantofpromise.bible;

import android.os.Bundle;
import android.webkit.WebSettings;

import com.getcapacitor.BridgeActivity;

public class MainActivity extends BridgeActivity {

    /**
     * S206 — pin the WebView text zoom to 100%.
     *
     * Android applies the system font-scale (Settings > Display > Font
     * size) as a textZoom multiplier inside app WebViews. On devices
     * with enlarged system fonts the reader's layout renders wider
     * than the viewport and the right edge clips off-screen on every
     * surface (caught live on Yoshi's phone, S206, during the
     * pre-beta walk; the same pages render perfectly in Chrome, which
     * reflows for font scale instead of zooming).
     *
     * Pinning to 100 matches iOS WKWebView behavior and leaves text
     * sizing to the app's own reader controls, which reflow properly.
     */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        WebSettings settings = this.bridge.getWebView().getSettings();
        settings.setTextZoom(100);
    }
}
