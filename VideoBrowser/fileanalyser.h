#ifndef FILEANALYSER_H
#define FILEANALYSER_H

#include <QDebug>
#include <QVariant>
#include <QByteArray>

#include <stdexcept>

#include "database.h"

class FileAnalyserStub
{
public:
    FileAnalyserStub() = delete;
    FileAnalyserStub(const QByteArray &fileData, const int fileID);
    virtual ~FileAnalyserStub();
    virtual void analyse();

protected:
    QByteArray fileData;
    int fileID;

    void store(int time, QVariant blob);

private:
};

class FileAnalyser : public FileAnalyserStub
{
public:
    FileAnalyser() = delete;
    FileAnalyser(const QByteArray &fileData, const int fileID);
    virtual ~FileAnalyser() override;
    virtual void analyse() override;

protected:

private:
};

#endif // FILEANALYSER_H
