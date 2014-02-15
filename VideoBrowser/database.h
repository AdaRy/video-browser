#ifndef DATABASE_H
#define DATABASE_H

#include <QString>

class Database
{
public:
    Database();
    void query(QString queryString);

protected:

private:
    void connect();
};

#endif // DATABASE_H
