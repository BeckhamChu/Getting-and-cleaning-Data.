library(dplyr)

data_path <- "/home/rstudio/UCI HAR Dataset"


features <- read.table(file.path(data_path, "features.txt"), col.names = c("index", "feature"))
activity_labels <- read.table(file.path(data_path, "activity_labels.txt"), col.names = c("id", "activity"))

x_train <- read.table(file.path(data_path, "train", "X_train.txt"))
y_train <- read.table(file.path(data_path, "train", "y_train.txt"), col.names = "activity")
subject_train <- read.table(file.path(data_path, "train", "subject_train.txt"), col.names = "subject")

x_test <- read.table(file.path(data_path, "test", "X_test.txt"))
y_test <- read.table(file.path(data_path, "test", "y_test.txt"), col.names = "activity")
subject_test <- read.table(file.path(data_path, "test", "subject_test.txt"), col.names = "subject")

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

mean_std_indices <- grep("mean\\(\\)|std\\(\\)", features$feature)
x_data <- x_data[, mean_std_indices]
names(x_data) <- features$feature[mean_std_indices]

y_data$activity <- factor(y_data$activity, levels = activity_labels$id, labels = activity_labels$activity)

names(x_data) <- gsub("^t", "Time", names(x_data))
names(x_data) <- gsub("^f", "Frequency", names(x_data))
names(x_data) <- gsub("Acc", "Accelerometer", names(x_data))
names(x_data) <- gsub("Gyro", "Gyroscope", names(x_data))
names(x_data) <- gsub("Mag", "Magnitude", names(x_data))
names(x_data) <- gsub("BodyBody", "Body", names(x_data))
names(x_data) <- gsub("-mean\\(\\)", "Mean", names(x_data))
names(x_data) <- gsub("-std\\(\\)", "STD", names(x_data))
names(x_data) <- gsub("-", "", names(x_data))

clean_data <- cbind(subject_data, y_data, x_data)

tidy_data <- clean_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = "drop")

write.table(tidy_data, "tidy_dataset.txt", row.names = FALSE)