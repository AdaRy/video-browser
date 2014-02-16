#include "fileanalyser.h"

FileAnalyserStub::FileAnalyserStub(const QByteArray &fileData, const int fileID):
    fileData(fileData),
    fileID(fileID)
{
    if (fileData.isNull() || fileData.isEmpty()) {
        throw std::runtime_error("File data is empty");
    }

    if (! fileID || fileID < 0) {
        throw std::runtime_error("FileID cannot be zero or less than zero");
    }
}

FileAnalyserStub::~FileAnalyserStub()
{

}

void FileAnalyserStub::store(int time, QVariant blob)
{
    if (time <= 0 || ! blob.isValid() || blob.isNull()) {
        throw std::runtime_error("Time and blob are necessary parameters");
    }

    Database &database = *Database::getInstance();
    QSqlQuery query = database.getQuery();

    query.prepare("INSERT INTO Analysis (FileID, Timestamp, Data) VALUES (?, ?, ?)");
    query.addBindValue(fileID);
    query.addBindValue(time);
    query.addBindValue(blob);

    if (! query.exec()) {
        throw std::runtime_error(query.lastError().text().toStdString());
    }
}

void FileAnalyserStub::analyse()
{
    qDebug() << "Analysis is in progress";

    for (int i = 1; i <= 10; ++i) {
        qDebug() << "Analysing";
        QByteArray byteArray("Teszt " + i);
        this->store(i, QVariant::fromValue(byteArray));
    }
}

FileAnalyser::FileAnalyser(const QByteArray &fileData, const int fileID) : FileAnalyserStub(fileData, fileID)
{
}

FileAnalyser::~FileAnalyser()
{

}

void FileAnalyser::analyse()
{

}
