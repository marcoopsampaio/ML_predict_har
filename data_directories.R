# A master function that stats and creates a data directory and a log file to keep information on when downloads were made and sub-directories and files were created.

# This function uses the working directory as reference
  make_data_directory <- function(directory_name){
    if(!file.exists(directory_name) & directory_name != "./" & directory_name != "." & directory_name != ""){
        dir.create(directory_name)
      dir_log <- file(paste(directory_name,"/directory.log",sep=""),"a")
      write(paste("Directory ",as.character(directory_name)," was created at ",system("date -u", intern = TRUE)), file = dir_log, append = TRUE)
        close(dir_log)
    }
    else if(directory_name == "./" | directory_name == "." | directory_name == ""){
        stop("Please specify a valid directory to hold your data!")
    }
    else{
        warning(paste("The",directory_name,"directory and directory.log already exist."))
    }
    directory_name
  }

# A function that stats for a sub-directory and creates it if necessary and writes and entry in the log.
  make_data_sub_directory <- function(directory_name, sub_directory_name){
    # make master directory first if necessary
    make_data_directory(directory_name)
    # Then move on to make this sub-directory
    rel_path <-paste(directory_name,"/",sub_directory_name,sep="") 
    if(!file.exists(rel_path)){
      dir.create(rel_path)
      dir_log <- file(paste(directory_name,"/directory.log",sep=""),"a")
      write(paste("sub-directory",rel_path,"was created at ",system("date -u", intern = TRUE)), dir_log, append = TRUE)
      close(dir_log)
    }else{
      warning(paste("The",rel_path,"directory already exists."))
    }
    rel_path
  }

# A function that stats for a downloaded file and downloads it if necessary and writes an entry in the log.
  make_data_file_download <- function(directory_name, sub_directory_name,url_path,filename){
    # make master directory first if necessary
    make_data_directory(directory_name)
    # make sub directory if necessary
    make_data_sub_directory(directory_name, sub_directory_name)
    # Then download file
    rel_path <-paste(directory_name,"/",sub_directory_name,sep="") 
    rel_path_file <-paste(directory_name,"/",sub_directory_name,"/",filename,sep="") 
    if(!file.exists(rel_path_file)){
      file_log <- file(paste(rel_path_file,".log",sep=""),"w")
      download.file(url_path, destfile	= rel_path_file)
      write(paste("File",rel_path_file,"was downloaded at",system("date -u", intern = TRUE),"from the following url: ",url_path), file_log)
      close(file_log)
    }else{
      warning(paste("The",rel_path_file,"file already exists."))
    }
    rel_path_file
  }
