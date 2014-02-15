#ifndef VIDEOBROWSER_H
#define VIDEOBROWSER_H

#include "database.h"
#include "fileanalyser.h"
#include "filehandler.h"

class VideoBrowser
{
public:
    VideoBrowser();
    FileHandler getFileHandler();
    Database getDatabase();
    FileAnalyserStub getFileAnalyser();

protected:

private:
     Database *database;
     FileAnalyserStub *fileAnalyser;
     FileHandler *fileHandler;
};

#endif // VIDEOBROWSER_H
