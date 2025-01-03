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

#ifndef SHAREUTILS_H
#define SHAREUTILS_H

#include <QQuickItem>

class PlatformShareUtils : public QQuickItem
{
public:
    PlatformShareUtils(QQuickItem *parent = 0) : QQuickItem(parent){}
    virtual ~PlatformShareUtils() {}
    virtual void share(const QString &text, const QUrl &url){ qDebug() << text << url; }
    virtual void shareJustText(const QString &text){ qDebug() << text; }
    virtual void shareTextAsFile(const QString &vals){ qDebug() << "Android only for the moment: " << vals;}
};

class ShareUtils : public QQuickItem
{
    Q_OBJECT
    QML_ELEMENT
    PlatformShareUtils* _pShareUtils;
public:
    explicit ShareUtils(QQuickItem *parent = 0);
    Q_INVOKABLE void share(const QString &text, const QUrl &url);
    Q_INVOKABLE void shareJustText(const QString &text);
    Q_INVOKABLE void shareTextAsFile(const QString &vals);
};

#endif //SHAREUTILS_H
