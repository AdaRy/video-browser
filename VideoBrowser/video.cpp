#include "video.h"

Video::Video(unsigned int fileID) :
    fileID(fileID),
    database(Database::getInstance())
{
        QSqlQuery query = database->getQuery();
        query.prepare("SELECT                   "
                      "    File.FilePath,       "
                      "    File.FileName,       "
                      "    File.Preview,        "
                      "    Metadata.Length,     "
                      "    Metadata.Resolution, "
                      "    Metadata.Author,     "
                      "    Metadata.Title,      "
                      "    Metadata.Language    "
                      "FROM                     "
                      "    File,                "
                      "    Metadata             "
                      "WHERE                    "
                      "    File.FileID = Metadata.FileID "
                      "AND File.FileID = ?");
        query.addBindValue(fileID);


    if (! query.exec()) {
        throw std::runtime_error(query.lastError().text().toStdString());
    }

    if (! query.size()) {
        throw std::runtime_error("Provided FileID does not exist.");
    }

    if (query.next()) {
        this->setFilePath(query.value(0).toString());
        this->setFileName(query.value(1).toString());
        this->setPreview(query.value(2).toByteArray());
        this->setLength(query.value(3).toInt());
        this->setResolution(query.value(4).toString());
        this->setAuthor(query.value(5).toString());
        this->setTitle(query.value(6).toString());
        this->setLanguage(query.value(7).toString());
    }
}

int Video::getLength() const
{
    return length;
}

void Video::setLength(int value)
{
    length = value;
}

QString Video::getResolution() const
{
    return resolution;
}

void Video::setResolution(QString value)
{
    resolution = value;
}
QString Video::getAuthor() const
{
    return author;
}

void Video::setAuthor(const QString &value)
{
    author = value;
}
QString Video::getTitle() const
{
    return title;
}

void Video::setTitle(const QString &value)
{
    title = value;
}
QString Video::getLanguage() const
{
    return language;
}

void Video::setLanguage(const QString &value)
{
    language = value;
}
QString Video::getFilePath() const
{
    return filePath;
}

void Video::setFilePath(const QString &value)
{
    filePath = value;
}
QString Video::getFileName() const
{
    return fileName;
}

void Video::setFileName(const QString &value)
{
    fileName = value;
}
QByteArray Video::getPreview() const
{
    return preview;
}

void Video::setPreview(const QByteArray &value)
{
    preview = value;
}
unsigned int Video::getFileID() const
{
    return fileID;
}
