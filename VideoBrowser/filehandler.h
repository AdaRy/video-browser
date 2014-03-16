#ifndef FILEHANDLER_H
#define FILEHANDLER_H

#include <QString>
#include <QByteArray>
#include <QFileInfo>
#include <QFile>

#include <MediaInfo/MediaInfo.h>
#include <stdexcept>

#include "database.h"
#include "fileanalyser.h"

class FileHandler
{
public:
    FileHandler() = delete;
    FileHandler(const QString &filePath);

    void processFile();

private:
    Database *database;
    int fileID;
    QString filePath;
    MediaInfoLib::MediaInfo mediaInfoHandle;

    void analyseFile();
    QByteArray retrieveFile();
    void createMediaInfoHandle();
    void insertIntoDatabase();
    void writeMetadataToDb();
};

#endif // FILEHANDLER_H
