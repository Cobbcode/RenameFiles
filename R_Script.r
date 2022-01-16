# This will rename every MP4 file in a folder - make sure to have backups
# and that you're sure you want to rename every single file in the folder

# Choose folder where files of interest are stored
folder_path <- choose.dir(default = "",caption = "Select folder where files are") 

# Set working directory to where files are stored
setwd(folder_path) 

# get a list of files with the specified pattern, e.g. mp4 for videos
file_list <- list.files(path = folder_path, pattern = "mp4")
file_list

# Count the number of files in the file list
number_of_files <- length(file_list)

# Set seed ensures you can reproduce the same random numbers again in the next
# step, otherwise every time you run it, will be a different set of numbers
set.seed(1)  

# calculate random numbers, without replacement (so each value is unique)
# to match the number of files you have
random_numbers <- sample(1:1000, size = number_of_files, replace=FALSE)

# Add "mp4" onto end of each number, so file has correct extension
# and so each number is now string/text character rather than an integer
# If files are not mp4 - remember to change this!
random_numbers_text <- paste(random_numbers,".mp4")

# concatenate columns to make one data frame
data_frame <- data.frame(file_list, random_numbers_text)

# add column headers to data frame
column_header <- c("Original file name", "New file name")
names(data_frame) <- column_header

# Write a text file to folder, storing the original names and new names
write.table(data_frame,"file_list.txt",sep="\t", row.names=FALSE)

# rename file list with the list of random numbers
file.rename(file_list, random_numbers_text)
