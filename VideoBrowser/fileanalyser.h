#ifndef FILEANALYSER_H
#define FILEANALYSER_H

#include <QVariant>

class FileAnalyserStub {
public:
    FileAnalyserStub();
    virtual ~FileAnalyserStub();
    void store(int id, int time, QVariant blob);

protected:
    virtual void analyse(int id);

private:

};

class FileAnalyser : public FileAnalyserStub
{
public:
    FileAnalyser();
    virtual ~FileAnalyser() override;

protected:
    virtual void analyse(int id) override;

private:
};

#endif // FILEANALYSER_H
