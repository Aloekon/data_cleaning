library(data.table)
library(dplyr)
test_data = fread("./test/X_test.txt")
train_data = fread("./train/X_train.txt")
test_act = fread("./test/y_test.txt")
train_act = fread("./train/y_train.txt")
activity_name = fread("./activity_labels.txt")
test_subject = fread("./test/subject_test.txt")
train_subject = fread("./train/subject_train.txt")
subject = rbind(train_subject, test_subject)
names(subject)[1] = "subject"
act = rbind(train_act, test_act)
names(act)[1] = "activity"
res = rbind(train_data, test_data)
res = tbl_df(res)
feature_names = fread("./features.txt")
colnames(res) = feature_names$V2
res = res[grep("mean[^a-zA-Z]|std|subject", feature_names$V2, value = T)]
res = cbind(res, act, subject)
res = tbl_df(res)
res = mutate(res, activity = activity_name$V2[activity])
res2 = res %>% group_by(subject, activity) %>% summarise_all(mean)