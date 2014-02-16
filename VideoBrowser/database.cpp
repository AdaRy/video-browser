#include "database.h"

Database *Database::instance = nullptr;

Database::Database()
{
    this->connect();
}

Database::~Database()
{
    if (database.isValid() && database.isOpen()) {
        database.close();
    }
}

Database *Database::getInstance()
{
    if (instance == nullptr) {
        instance = new Database();
    }

    return instance;
}

QSqlQuery Database::getQuery()
{
    if (! database.isOpen() || ! database.isValid()) {
        this->connect();
    }

    QSqlQuery query(database);
    return query;
}

QSqlQuery Database::queryExec(const QString &queryString)
{
    QSqlQuery query = this->getQuery();
    query.prepare(queryString);
    if (! query.exec()) {
        throw std::runtime_error(query.lastError().text().toStdString());
    }

    return query;
}

void Database::connect()
{
    if (! database.isValid() || ! database.isOpen()) {
        database = QSqlDatabase::addDatabase("QSQLITE");
        database.setDatabaseName("database.sqlite");
        if (database.open()) {
            this->createTables();
        } else {
            throw std::runtime_error(database.lastError().text().toStdString());
        }
    }
}

void Database::createTables()
{
    QSqlQuery query(database);

    // http://qt-project.org/doc/qt-5/qsqlquery.html#exec
    // For SQLite, the query string can contain only one statement at a time. If more than one statement is given, the function returns false.

    //  -- -----------------------------------------------------
    //  -- Table `File`
    //  -- -----------------------------------------------------
    query.prepare("CREATE TABLE IF NOT EXISTS `File` ("
                  "  `FileID` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
                  "  `FilePath` TEXT NOT NULL,"
                  "  `FileName` TEXT NOT NULL,"
                  "  `Preview` BLOB NULL);");
    if (! query.exec()) {
        throw std::runtime_error(query.lastError().text().toStdString());
    }


    //  -- -----------------------------------------------------
    //  -- Table `Metadata`
    //  -- -----------------------------------------------------
    query.prepare("CREATE TABLE IF NOT EXISTS `Metadata` ("
                  "  `FileID` INTEGER PRIMARY KEY NOT NULL,"
                  "  `Length` DOUBLE NOT NULL,"
                  "  `Resolution` TEXT NOT NULL,"
                  "  `Author` TEXT NULL,"
                  "  `Title` TEXT NULL,"
                  "  `Language` TEXT NULL);");
    if (! query.exec()) {
        throw std::runtime_error(query.lastError().text().toStdString());
    }

    //  -- -----------------------------------------------------
    //  -- Table `Analysis`
    //  -- -----------------------------------------------------
    query.prepare("CREATE TABLE IF NOT EXISTS `Analysis` ("
                  "  `AnalysisID` INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,"
                  "  `FileID` INTEGER NOT NULL,"
                  "  `Timestamp` DOUBLE NOT NULL,"
                  "  `Data` BLOB NOT NULL);");
    if (! query.exec()) {
        throw std::runtime_error(query.lastError().text().toStdString());
    }
}

