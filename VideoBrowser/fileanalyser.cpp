#include "fileanalyser.h"

FileAnalyserStub *FileAnalyserStub::instance = nullptr;

FileAnalyserStub::FileAnalyserStub()
{
}

FileAnalyserStub::~FileAnalyserStub()
{

}

FileAnalyserStub *FileAnalyserStub::getInstance()
{
    if (instance == nullptr) {
        instance = new FileAnalyserStub();
    }

    return instance;
}

void FileAnalyserStub::store(int id, int time, QVariant blob)
{

}

void FileAnalyserStub::analyse(QByteArray data)
{

}

FileAnalyser::FileAnalyser()
{
}

FileAnalyser::~FileAnalyser()
{

}

void FileAnalyser::analyse(QByteArray data)
{

}
