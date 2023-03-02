import QtQuick 2.0
import QtWebView 1.1

WebView {
    id: campusMap

    width: window.width
    height: window.height
    url: "https://www.visitpasadena.com/convention-center/planners/facility-map/"

    onLoadingChanged:{
        runJavaScript("document.querySelector('h1').style.padding='20px 0 0 0'");
        runJavaScript("document.querySelector('header.page-header').remove()");
        runJavaScript("document.querySelector('header.area-header').remove()");
        runJavaScript("document.querySelector('footer.page-footer').remove()");
        runJavaScript("document.querySelector('.page__header').remove()");
        runJavaScript("document.querySelector('.list--social').remove()");
        runJavaScript("document.querySelector('#signup-msg').remove()");
        runJavaScript("document.querySelectorAll('.btn--arrow').forEach(elem => elem.remove())");

        if(loadRequest.errorString){
            console.error("Webview errorString() -> "+loadRequest.errorString);
        }
    }
}
