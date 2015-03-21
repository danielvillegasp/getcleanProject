# run_analysis.R
require(data.table)
require(reshape2)

# init
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)
data.dir <- './Data/UCI HAR Dataset/'

renameMeanStd <- function(x){
    # check if either mean() or std() are contained in the vector and applies pastes them
    # examples:
    # renameMeanStd(c('hello', 'mean()', 'X'))
    # [1] "helloMeanX"
    # renameMeanStd(c('hello', 'std()', 'X'))
    # [1] "helloStdX"
    # renameMeanStd(c('hello', 'foo()', 'X'))
    # [1] "hello-foo()-X"
    
    if('mean()' %in% x){
        x[2] = "Mean"
        paste(x, collapse="",sep="")
    }else if('std()' %in% x){
        x[2] = "Std"
        paste(x, collapse="", sep="")
    }else{
        paste(x, collapse="-",sep="")
    }
}

get_means <- function(dataset){
    dcast(melt(dataset, id=c('Subject', 'Activity'), measure.vars = 3:68), 
          Subject + Activity ~ variable, 
          mean)
}

run_analysis <- function(baseDir='.',fsep='/'){
    # Description
    #   The function runs the analysis as per described in the instructions for the assignment
    # Arguments
    #   baseDir is the base directory where the data is located
    #   fsep is the separator that is going to be used to create paths to file
    dir <- baseDir
    # get the activity labels from activity_labels.txt
    ActivityLabels <- read.csv(file.path(dir, 'activity_labels.txt', fsep=fsep),
                               header=F,
                               sep=" ",
                               col.names=c("Id", "Name"))
    # get the names of the features from features.txt
    FeatureNames <- as.character(read.csv(file.path(dir, 'features.txt', fsep=fsep),
                                 header=F,
                                 sep=" ")[, 2])
    # Change the feature names which contain either main or std for the name that is going to be
    # used in the dataframe, the naming convention format for the selected columns is snake case.
    FeatureNewNames <- lapply(strsplit(FeatureNames, '-'), renameMeanStd)
    parts <- c("test", "train")
    dataset = data.table()
    # loop through the names "test" and "train" in order to get the data from both directories
    for(part in parts){
        # create the filename from file where the activity indexes are stored e.g. "y_train.txt"
        actFileName <- paste('y_', part, '.txt', sep="",collapse="")
        # get the activities from files
        activityVals <- as.numeric(readLines(file.path(dir, part, actFileName, fsep=fsep)))
        # create factor relating activity names with the indexes
        activities <- factor(activityVals,
                             levels=ActivityLabels$Id,
                             labels=ActivityLabels$Name)
        
        # create filename from file where the feature vectors are stored e.g. "X_train.txt"
        featuresFileName <- paste('X_', part, '.txt', sep="",collapse="")
        # read features from file
        features <- read.table(file.path(dir, part, featuresFileName, fsep=fsep),
                               header=F,
                               col.names=FeatureNewNames)
        # read subject ids from file
        subjectFileName <- paste('/subject_', part, '.txt', sep="", collsep="")
        # create a tidy dataset with "test" or "train" data 
        TDF <- data.table(
            Subject = readLines(file.path(dir, part, subjectFileName,
                                          fsep=fsep)),
            Activity=activities,
            features[, grepl(pattern="mean\\(\\)", x=FeatureNames) |
                         grepl(pattern="std\\(\\)", x=FeatureNames)],
            # labels each row with the dataset from where it was estractred i.e. "train" or "test"
            Set=rep(part, length(activities))
            )
        # combine both datasets "train" and "test"
        dataset <- rbind(dataset, TDF)
    }
    # return dataset
    dataset
}

DF<-run_analysis(baseDir=data.dir)
#write.csv(DF, file="./tidy1.csv", row.names=F)
tds2 <- get_means(DF)
write.csv(tds2, file="./tidy2.csv", row.names=F)