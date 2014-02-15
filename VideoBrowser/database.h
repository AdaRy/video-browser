#ifndef DATABASE_H
#define DATABASE_H

#include <QDebug>
#include <QString>
#include <QSql>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>

#include <utility>

class Database
{
public:
    Database();
    ~Database();
    static Database *getInstance();

    QSqlQuery &&query();

protected:

private:
    static Database *instance;
    QSqlDatabase database;

    bool connect();
    void createDatabase();
};

#endif // DATABASE_H
