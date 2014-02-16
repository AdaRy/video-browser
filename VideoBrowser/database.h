#ifndef DATABASE_H
#define DATABASE_H

#include <QDebug>
#include <QString>
#include <QSql>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QVariant>

#include <stdexcept>

class Database
{
public:
    static Database *getInstance();
    QSqlQuery getQuery();
    QSqlQuery queryExec(const QString &queryString = QString::null);
    QVariant lastInsertId();

protected:

private:
    Database();
    ~Database();
    Q_DISABLE_COPY(Database)

    static Database *instance;
    QSqlDatabase database;

    void connect();
    void createTables();
};

#endif // DATABASE_H
