#ifndef FILEHANDLER_H
#define FILEHANDLER_H

#include <QString>
#include <QByteArray>

class FileHandler
{
public:
    FileHandler();
    void addFile(QString fileName);
    QByteArray retrieveFile(QString fileName);
    void getPreview(QString fileName);
    void search();

protected:

private:
    void analyseFile(QString fileName);
    void insertIntoDatabase(QString fileName);
};

#endif // FILEHANDLER_H
