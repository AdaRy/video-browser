#ifndef VIDEOHANDLER_H
#define VIDEOHANDLER_H

#include <QList>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "database.h"
#include "video.h"

class VideoHandler
{
public:
    VideoHandler();

    QList<unsigned int> getAllFileIds();
    Video getVideoById(unsigned int fileID);

private:
    Database *database;
};

#endif // VIDEOHANDLER_H
