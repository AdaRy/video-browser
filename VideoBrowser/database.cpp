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

QSqlQuery&& Database::query()
{
    QSqlQuery query;
    return std::move(query);
}

bool Database::connect()
{
    if (! database.isValid() || ! database.isOpen()) {
        database = QSqlDatabase::addDatabase("QSQLITE");
        database.setDatabaseName("database.sqlite");
        if (database.open()) {
            this->createDatabase();
        } else {
            qWarning() << database.lastError().text();
            goto error;
        }
    }

    return true;

error:
    if (database.isValid()) {
        database.close();
    }

    return false;
}

void Database::createDatabase()
{
    QSqlQuery query("-- -----------------------------------------------------"
                    "-- Table `Metadata`"
                    "-- -----------------------------------------------------"
                    "CREATE TABLE IF NOT EXISTS `Metadata` ("
                    "  `FileID` INTEGER NOT NULL,"
                    "  `Length` DOUBLE NULL,"
                    "  `Author` TEXT NULL,"
                    "  `Title` TEXT NULL,"
                    "  `Language` TEXT NULL,"
                    "  PRIMARY KEY (`FileID`));"
                    ""
                    ""
                    "-- -----------------------------------------------------"
                    "-- Table `File`"
                    "-- -----------------------------------------------------"
                    "CREATE TABLE IF NOT EXISTS `File` ("
                    "  `FileID` INTEGER NOT NULL,"
                    "  `FileName` TEXT NOT NULL,"
                    "  `Preview` BLOB NULL,"
                    "  `Resolution` TEXT NULL,"
                    "  PRIMARY KEY (`FileID`));"
                    ""
                    ""
                    "-- -----------------------------------------------------"
                    "-- Table `Analysis`"
                    "-- -----------------------------------------------------"
                    "CREATE TABLE IF NOT EXISTS `Analysis` ("
                    "  `AnalysisID` INTEGER NOT NULL,"
                    "  `FileID` INT NOT NULL,"
                    "  `Timestamp` DOUBLE NOT NULL,"
                    "  `Data` BLOB NOT NULL,"
                    "  PRIMARY KEY (`AnalysisID`));");

    query.exec();
}

