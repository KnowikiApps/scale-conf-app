import QtQuick 2.0
import QtWebView 1.1

WebView {
    id: specialEventsPage

    width: window.width
    height: window.height
    url: "https://www.socallinuxexpo.org/scale/17x/events"

    onLoadingChanged:{
        if(loadRequest.errorString){
            console.error("Webview errorString() -> "+loadRequest.errorString);
        }
    }
}
