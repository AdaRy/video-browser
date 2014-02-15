#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"

#include "videobrowser.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    VideoBrowser videoBrowser;

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/VideoBrowser/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
