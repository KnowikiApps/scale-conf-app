import QtQuick 2.0
import QtWebView 1.1

WebView {
    id: speakersPage

    width: window.width
    height: window.height
    url: "https://www.socallinuxexpo.org/scale/17x/speakers"

    onLoadingChanged:{
        if(loadRequest.errorString){
            console.error("Webview errorString() -> "+loadRequest.errorString);
        }
    }
}
