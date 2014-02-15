#ifndef FILEANALYSER_H
#define FILEANALYSER_H

#include <QVariant>
#include <QByteArray>

class FileAnalyserStub
{
public:
    FileAnalyserStub();
    virtual ~FileAnalyserStub();
    static FileAnalyserStub *getInstance();

    void store(int id, int time, QVariant blob);

protected:
    virtual void analyse(QByteArray data);

private:
    static FileAnalyserStub* instance;
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
