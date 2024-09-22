//=============================================================================
// Copyright (c) 2014 Nicolas Froment

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//=============================================================================

#include <qglobal.h>
// Macro added as QJniObject is not available on all platforms
#ifdef Q_OS_ANDROID
#include "androidshareutils.h"




#include <QJniObject>

#include "contactexporter.h"

AndroidShareUtils::AndroidShareUtils(QQuickItem* parent) : PlatformShareUtils(parent)
{
}

void AndroidShareUtils::share(const QString &text, const QUrl &url)
{
    QJniObject jsText = QJniObject::fromString(text);
    QJniObject jsUrl = QJniObject::fromString(url.toString());
    QJniObject::callStaticMethod<void>("org/qtproject/example/scale_conf/QShareUtils",
                                       "share",
                                       "(Ljava/lang/String;Ljava/lang/String;)V",
                                       jsText.object<jstring>(), jsUrl.object<jstring>());
}

void AndroidShareUtils::shareJustText(const QString &text)
{
    QJniObject jsText = QJniObject::fromString(text);
    QJniObject::callStaticMethod<void>("com/lasconic/QShareUtils",
                                       "shareJustText",
                                       "(Ljava/lang/String;)V",
                                       jsText.object<jstring>());
}

void AndroidShareUtils::shareTextAsFile(const QString &vals) {
    writeStringToFile(vals);
    QJniObject jsText = QJniObject::fromString(getFilePath());
    QJniObject::callStaticMethod<void>("com/lasconic/QShareUtils",
                                       "shareFile",
                                       "(Ljava/lang/String;)V",
                                       jsText.object<jstring>());

}
#endif
