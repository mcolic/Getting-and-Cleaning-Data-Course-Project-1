library(data.table)
library(dplyr)
library(tidyr)

if(!file.exists("./data")){dir.create("./data")}

#Features
features <- read.table("./data/UCI/features.txt")
        setnames(features,c("Features_ID","Features"))
        # extract only mean and stdev for each measurement
        extract_features <- grepl("mean|std", features$Features)

#Activity
activity <- read.table("./data/UCI/activity_labels.txt")
        setnames(activity,c("Activity_ID","Activity"))

#Train
Tr_x <- read.table("./data/UCI/train/X_train.txt")
        #Set Colnames
        setnames(Tr_x,as.character(features$Features))
        Tr_x <- Tr_x[,extract_features]

Tr_y <- read.table("./data/UCI/train/y_train.txt")
        #Set Colnames
        setnames(Tr_y,c("Activity_ID"))

Tr_sbj <- read.table("./data/UCI/train/subject_train.txt")
        #Set Colnames
        setnames(Tr_sbj,c("Subject"))

#Train Activity table
Tr_y <- merge(Tr_y,activity,by="Activity_ID")
Train <- cbind(Tr_sbj,Tr_y,Tr_x)
Train <- as.data.table(Train)



#Test
T_x <- read.table("./data/UCI/test/X_test.txt")
        setnames(T_x,as.character(features$Features))
        T_x <- T_x[,extract_features]

T_y <- read.table("./data/UCI/test/y_test.txt")
        setnames(T_y,c("Activity_ID"))

T_sbj <- read.table("./data/UCI/test/subject_test.txt")
        setnames(T_sbj,c("Subject"))

T_y <- merge(T_y,activity,by="Activity_ID")
Test <- cbind(T_sbj,T_y,T_x)
Test <- as.data.table(Test)


#Merge Train and Test data

data <- tbl_df(rbind(Train,Test))

#4 Tidy Data with average of each variable for each acitvity and each subject

tidy_data <- select(data,-Activity_ID)
tidy_data <- gather(tidy_data,variable,value,-(Subject:Activity))
grouped <- group_by(tidy_data, Subject,Activity,variable)
tidy_data <- summarise(grouped,mean(value))


#Export tidy data
write.table(tidy_data, file = "./tidy_data.txt",row.name = FALSE)





