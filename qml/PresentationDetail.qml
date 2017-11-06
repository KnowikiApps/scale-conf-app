import QtQuick 2.0
import QtWebView 1.1

WebView {
    id: webView
    property string page: ""

    width: window.width
    height: window.height
    url: "https://www.socallinuxexpo.org"+page

    onLoadingChanged:{
        if(loadRequest.errorString){
            console.error("Webview errorString() -> "+loadRequest.errorString);
        }
    }
}
