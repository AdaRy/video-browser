#include "videohandler.h"

VideoHandler::VideoHandler():
    database(Database::getInstance())
{
}

QList<unsigned int> VideoHandler::getAllFileIds()
{
    QList<unsigned int> fileIDs;

    QSqlQuery query = database->queryExec("SELECT FileID FROM File");

    if (! query.size()) {
        qDebug() << "No files in the database";
    }

    while (query.next()) {
        fileIDs.append(query.value(0).toUInt());
    }

    return fileIDs;
}

Video VideoHandler::getVideoById(unsigned int fileID)
{
    return Video(fileID);
}
