
        #load packages
        library(plyr)
        
        #load dataset files in R
        test.x <- read.table("./UCI HAR Dataset/test/X_test.txt", dec= " ")
        train.x <- read.table("./UCI HAR Dataset/train/X_train.txt", dec= " ")
        train.act <- read.table("./UCI HAR Dataset/train/Y_train.txt")
        test.act <- read.table("./UCI HAR Dataset/test/Y_test.txt")
        features <- read.table("./UCI HAR Dataset/features.txt")
        subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        
        #combine test and train datasets
        data <- rbind(test.x, train.x)
        
        #combine activity datasets and subject datasets
        activity <- rbind(test.act, train.act)
        subject <- rbind(subject.test, subject.train)
        
        #apply feature names to the columns in the activity dataset
        labels <- features$V2
        colnames(data) <- labels
        
        #trim the activity dataset to include only the variables for "mean". 
        meandata <- data[c(1,2,3,41,42,43, 81, 82, 83, 121, 122, 123, 161,162,163, 201, 214, 227, 240, 253, 266, 267, 268, 294, 295, 296, 345, 346, 347, 373, 374, 375, 424, 425, 426, 452, 453, 454, 503, 513, 516, 526, 529, 539, 542, 552, 556, 557,558,559,560,561)]
        
        #trim the activity dataset to include only the variables for "sd". 
        sd<- data[c(4,5,6, 44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254, 269, 270, 271, 348, 349, 350, 427, 428, 429, 504, 517, 530, 543)]
        
        #combine meandata and sd datasets
        
        dataset.2 <-cbind(meandata, sd)
        
        write.table(dataset.2, file= "dataset_2")
