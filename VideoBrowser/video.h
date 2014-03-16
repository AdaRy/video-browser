#ifndef VIDEO_H
#define VIDEO_H

#include <stdexcept>

#include <QString>
#include <QByteArray>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

#include "database.h"

class Video
{
public:
    Video() = delete;
    Video(unsigned int fileID);

    unsigned int getFileID() const;
    int getLength() const;
    QString getResolution() const;
    QString getAuthor() const;
    QString getTitle() const;
    QString getLanguage() const;
    QString getFilePath() const;
    QString getFileName() const;
    QByteArray getPreview() const;

private:
    unsigned int fileID;
    int length;
    QString resolution;
    QString author;
    QString title;
    QString language;
    QString filePath;
    QString fileName;
    QByteArray preview;

    Database *database;

    void setLength(int value);
    void setResolution(QString value);
    void setAuthor(const QString &value);
    void setTitle(const QString &value);
    void setLanguage(const QString &value);
    void setFilePath(const QString &value);
    void setFileName(const QString &value);
    void setPreview(const QByteArray &value);
};

#endif // VIDEO_H
