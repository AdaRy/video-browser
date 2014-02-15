#include "filehandler.h"

FileHandler *FileHandler::instance = nullptr;

FileHandler::FileHandler() :
    database(Database::getInstance())
{
}

void FileHandler::addFile(QString fileName)
{

}

FileHandler *FileHandler::getInstance()
{
    if (instance == nullptr) {
        instance = new FileHandler();
    }

    return instance;
}

QByteArray FileHandler::retrieveFile(QString fileName)
{

}

void FileHandler::getPreview(QString fileName)
{

}

void FileHandler::search()
{

}

void FileHandler::analyseFile(QString fileName)
{

}

void FileHandler::insertIntoDatabase(QString fileName)
{

}
