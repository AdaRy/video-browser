#include "filehandler.h"

FileHandler::FileHandler(const QString &filePath) :
    database(Database::getInstance()),
    filePath(filePath)
{
    if (! QFileInfo::exists(filePath)) {
        throw std::runtime_error("File" + filePath.toStdString() + "does not exist");
    }
}

void FileHandler::processFile()
{
    // Put basic info into the database
    this->insertIntoDatabase();

    // Reading and writing metadata
    this->createMediaInfoHandle();
    this->writeMetadataToDb();

    // Finally, we analyse
    this->analyseFile();
}

QByteArray FileHandler::getPreview(const int fileID)
{
    Q_UNUSED(fileID)
    return QByteArray();
}

void FileHandler::analyseFile()
{
    QByteArray fileData = this->retrieveFile();

    FileAnalyserStub fileAnalyser(fileData, fileID);
    fileAnalyser.analyse();
}

QByteArray FileHandler::retrieveFile()
{
    QFile file(filePath);
    if (! file.open(QIODevice::ReadOnly)) {
        throw std::runtime_error("Could not open file " + filePath.toStdString());
    }

    QByteArray fileData = file.readAll();
    file.close();

    return fileData;
}

void FileHandler::createMediaInfoHandle()
{
    mediaInfoHandle.Option(L"Internet", L"No");
    mediaInfoHandle.Option(L"CharSet", L"UTF-8");

    wchar_t *filePathWChar = new wchar_t[filePath.size() + 1];
    filePath.toWCharArray(filePathWChar);
    filePathWChar[filePath.size()] = '\0';
    bool opened = mediaInfoHandle.Open(filePathWChar);
    delete [] filePathWChar;

    if (! opened) {
        throw std::runtime_error("Could not open file " + filePath.toStdString());
    }

    QString videoInformation = QString::fromStdWString(mediaInfoHandle.Inform());
    qDebug() << videoInformation;
}

void FileHandler::insertIntoDatabase()
{
    const QFileInfo fileInfo(filePath);
    const QString fileName = fileInfo.completeBaseName();

    QSqlQuery query = database->queryExec(QString("INSERT INTO File (FilePath, FileName) VALUES ('%1', '%2')").arg(filePath).arg(fileName));
    fileID = query.lastInsertId().toInt();
}

void FileHandler::writeMetadataToDb()
{
    const QString width = QString::fromStdWString(mediaInfoHandle.Get(MediaInfoLib::stream_t::Stream_Video, 0, L"Width"));
    const QString height = QString::fromStdWString(mediaInfoHandle.Get(MediaInfoLib::stream_t::Stream_Video, 0, L"Height"));
    QString length = QString::fromStdWString(mediaInfoHandle.Get(MediaInfoLib::stream_t::Stream_Video, 0, L"Duration"));
    if (length.isEmpty() || length.isNull()) {
        length = "0";
    }
    const QString resultion = QString("%1x%2").arg(width).arg(height);

    database->queryExec(QString("INSERT INTO Metadata (FileID, Length, Resolution) VALUES(%1, %2, '%3')").arg(fileID).arg(length).arg(resultion));
}
