import QtQuick 2.0
import QtWebView 1.1

WebView {
    id: speakersPage

    width: window.width
    height: window.height
    url: "https://www.socallinuxexpo.org/scale/17x/speakers"

    onLoadingChanged:{
        runJavaScript("var nav = document.getElementById('navbar'); nav.parentNode.removeChild(nav)");
        runJavaScript("var lowsec = document.querySelectorAll('div.region-sidebar-first')[1]; lowsec.parentNode.removeChild(lowsec)");
        runJavaScript("var foot = document.querySelector('footer.footer'); foot.parentNode.removeChild(foot)");

        if(loadRequest.errorString){
            console.error("Webview errorString() -> "+loadRequest.errorString);
        }
    }
}
