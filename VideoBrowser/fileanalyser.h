#ifndef FILEANALYSER_H
#define FILEANALYSER_H

#include <QVariant>

class FileAnalyserStub {
public:
    FileAnalyserStub();
    virtual ~FileAnalyserStub();
    void store(int id, int time, QVariant blob);

protected:
    virtual void analyse(QByteArray data);

private:

};

class FileAnalyser : public FileAnalyserStub
{
public:
    FileAnalyser();
    virtual ~FileAnalyser() override;

protected:
    virtual void analyse(QByteArray data) override;

private:
};

#endif // FILEANALYSER_H
