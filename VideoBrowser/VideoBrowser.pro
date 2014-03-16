# Add more folders to ship with the application, here
folder_01.source = qml/VideoBrowser
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    filehandler.cpp \
    fileanalyser.cpp \
    database.cpp \
    videohandler.cpp \
    video.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    filehandler.h \
    fileanalyser.h \
    database.h \
    videohandler.h \
    video.h

CONFIG += c++11

QT += sql

LIBS += -lmediainfo

DEFINES += _UNICODE

QMAKE_CXXFLAGS += -Wall -Wextra -Werror
