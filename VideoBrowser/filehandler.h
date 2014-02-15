#ifndef FILEHANDLER_H
#define FILEHANDLER_H

#include <QString>
#include <QByteArray>

#include "database.h"

class FileHandler
{
public:
    FileHandler();
    static FileHandler *getInstance();

    void addFile(QString fileName);
    QByteArray retrieveFile(QString fileName);
    void getPreview(QString fileName);
    void search();


protected:

private:
    static FileHandler *instance;
    Database *database;
    void analyseFile(QString fileName);
    void insertIntoDatabase(QString fileName);
};

#endif // FILEHANDLER_H
