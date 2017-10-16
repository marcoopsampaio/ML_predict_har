# Data cleaning for HAR workout data

## Introduction
In this file I present the data cleaning steps of the Human  Activity Recognition workout data. Data and files will only be downloaded once and time stamped. For that purposed I load my own functions to create directories and files together with log files

```r
source('data_directories.R')
```


## Loading and preprocessing the data

### Loading the data
First we load the training data

```r
# Defining data_dir
data_dirname <- 'data'
raw_data_subdirname<-'raw'
url_training <- 'https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv'
training_data_filename<-'training.csv'
rel_path_training<-make_data_file_download(data_dirname,raw_data_subdirname,url_training,training_data_filename)
```

```
## Warning in make_data_directory(directory_name): The data directory and
## directory.log already exist.

## Warning in make_data_directory(directory_name): The data directory and
## directory.log already exist.
```

```
## Warning in make_data_sub_directory(directory_name, sub_directory_name): The
## data/raw directory already exists.
```

```
## Warning in make_data_file_download(data_dirname, raw_data_subdirname,
## url_training, : The data/raw/training.csv file already exists.
```


```r
training0<-read.csv(rel_path_training)
head(training0)
```

```
##   X user_name raw_timestamp_part_1 raw_timestamp_part_2   cvtd_timestamp
## 1 1  carlitos           1323084231               788290 05/12/2011 11:23
## 2 2  carlitos           1323084231               808298 05/12/2011 11:23
## 3 3  carlitos           1323084231               820366 05/12/2011 11:23
## 4 4  carlitos           1323084232               120339 05/12/2011 11:23
## 5 5  carlitos           1323084232               196328 05/12/2011 11:23
## 6 6  carlitos           1323084232               304277 05/12/2011 11:23
##   new_window num_window roll_belt pitch_belt yaw_belt total_accel_belt
## 1         no         11      1.41       8.07    -94.4                3
## 2         no         11      1.41       8.07    -94.4                3
## 3         no         11      1.42       8.07    -94.4                3
## 4         no         12      1.48       8.05    -94.4                3
## 5         no         12      1.48       8.07    -94.4                3
## 6         no         12      1.45       8.06    -94.4                3
##   kurtosis_roll_belt kurtosis_picth_belt kurtosis_yaw_belt
## 1                                                         
## 2                                                         
## 3                                                         
## 4                                                         
## 5                                                         
## 6                                                         
##   skewness_roll_belt skewness_roll_belt.1 skewness_yaw_belt max_roll_belt
## 1                                                                      NA
## 2                                                                      NA
## 3                                                                      NA
## 4                                                                      NA
## 5                                                                      NA
## 6                                                                      NA
##   max_picth_belt max_yaw_belt min_roll_belt min_pitch_belt min_yaw_belt
## 1             NA                         NA             NA             
## 2             NA                         NA             NA             
## 3             NA                         NA             NA             
## 4             NA                         NA             NA             
## 5             NA                         NA             NA             
## 6             NA                         NA             NA             
##   amplitude_roll_belt amplitude_pitch_belt amplitude_yaw_belt
## 1                  NA                   NA                   
## 2                  NA                   NA                   
## 3                  NA                   NA                   
## 4                  NA                   NA                   
## 5                  NA                   NA                   
## 6                  NA                   NA                   
##   var_total_accel_belt avg_roll_belt stddev_roll_belt var_roll_belt
## 1                   NA            NA               NA            NA
## 2                   NA            NA               NA            NA
## 3                   NA            NA               NA            NA
## 4                   NA            NA               NA            NA
## 5                   NA            NA               NA            NA
## 6                   NA            NA               NA            NA
##   avg_pitch_belt stddev_pitch_belt var_pitch_belt avg_yaw_belt
## 1             NA                NA             NA           NA
## 2             NA                NA             NA           NA
## 3             NA                NA             NA           NA
## 4             NA                NA             NA           NA
## 5             NA                NA             NA           NA
## 6             NA                NA             NA           NA
##   stddev_yaw_belt var_yaw_belt gyros_belt_x gyros_belt_y gyros_belt_z
## 1              NA           NA         0.00         0.00        -0.02
## 2              NA           NA         0.02         0.00        -0.02
## 3              NA           NA         0.00         0.00        -0.02
## 4              NA           NA         0.02         0.00        -0.03
## 5              NA           NA         0.02         0.02        -0.02
## 6              NA           NA         0.02         0.00        -0.02
##   accel_belt_x accel_belt_y accel_belt_z magnet_belt_x magnet_belt_y
## 1          -21            4           22            -3           599
## 2          -22            4           22            -7           608
## 3          -20            5           23            -2           600
## 4          -22            3           21            -6           604
## 5          -21            2           24            -6           600
## 6          -21            4           21             0           603
##   magnet_belt_z roll_arm pitch_arm yaw_arm total_accel_arm var_accel_arm
## 1          -313     -128      22.5    -161              34            NA
## 2          -311     -128      22.5    -161              34            NA
## 3          -305     -128      22.5    -161              34            NA
## 4          -310     -128      22.1    -161              34            NA
## 5          -302     -128      22.1    -161              34            NA
## 6          -312     -128      22.0    -161              34            NA
##   avg_roll_arm stddev_roll_arm var_roll_arm avg_pitch_arm stddev_pitch_arm
## 1           NA              NA           NA            NA               NA
## 2           NA              NA           NA            NA               NA
## 3           NA              NA           NA            NA               NA
## 4           NA              NA           NA            NA               NA
## 5           NA              NA           NA            NA               NA
## 6           NA              NA           NA            NA               NA
##   var_pitch_arm avg_yaw_arm stddev_yaw_arm var_yaw_arm gyros_arm_x
## 1            NA          NA             NA          NA        0.00
## 2            NA          NA             NA          NA        0.02
## 3            NA          NA             NA          NA        0.02
## 4            NA          NA             NA          NA        0.02
## 5            NA          NA             NA          NA        0.00
## 6            NA          NA             NA          NA        0.02
##   gyros_arm_y gyros_arm_z accel_arm_x accel_arm_y accel_arm_z magnet_arm_x
## 1        0.00       -0.02        -288         109        -123         -368
## 2       -0.02       -0.02        -290         110        -125         -369
## 3       -0.02       -0.02        -289         110        -126         -368
## 4       -0.03        0.02        -289         111        -123         -372
## 5       -0.03        0.00        -289         111        -123         -374
## 6       -0.03        0.00        -289         111        -122         -369
##   magnet_arm_y magnet_arm_z kurtosis_roll_arm kurtosis_picth_arm
## 1          337          516                                     
## 2          337          513                                     
## 3          344          513                                     
## 4          344          512                                     
## 5          337          506                                     
## 6          342          513                                     
##   kurtosis_yaw_arm skewness_roll_arm skewness_pitch_arm skewness_yaw_arm
## 1                                                                       
## 2                                                                       
## 3                                                                       
## 4                                                                       
## 5                                                                       
## 6                                                                       
##   max_roll_arm max_picth_arm max_yaw_arm min_roll_arm min_pitch_arm
## 1           NA            NA          NA           NA            NA
## 2           NA            NA          NA           NA            NA
## 3           NA            NA          NA           NA            NA
## 4           NA            NA          NA           NA            NA
## 5           NA            NA          NA           NA            NA
## 6           NA            NA          NA           NA            NA
##   min_yaw_arm amplitude_roll_arm amplitude_pitch_arm amplitude_yaw_arm
## 1          NA                 NA                  NA                NA
## 2          NA                 NA                  NA                NA
## 3          NA                 NA                  NA                NA
## 4          NA                 NA                  NA                NA
## 5          NA                 NA                  NA                NA
## 6          NA                 NA                  NA                NA
##   roll_dumbbell pitch_dumbbell yaw_dumbbell kurtosis_roll_dumbbell
## 1      13.05217      -70.49400    -84.87394                       
## 2      13.13074      -70.63751    -84.71065                       
## 3      12.85075      -70.27812    -85.14078                       
## 4      13.43120      -70.39379    -84.87363                       
## 5      13.37872      -70.42856    -84.85306                       
## 6      13.38246      -70.81759    -84.46500                       
##   kurtosis_picth_dumbbell kurtosis_yaw_dumbbell skewness_roll_dumbbell
## 1                                                                     
## 2                                                                     
## 3                                                                     
## 4                                                                     
## 5                                                                     
## 6                                                                     
##   skewness_pitch_dumbbell skewness_yaw_dumbbell max_roll_dumbbell
## 1                                                              NA
## 2                                                              NA
## 3                                                              NA
## 4                                                              NA
## 5                                                              NA
## 6                                                              NA
##   max_picth_dumbbell max_yaw_dumbbell min_roll_dumbbell min_pitch_dumbbell
## 1                 NA                                 NA                 NA
## 2                 NA                                 NA                 NA
## 3                 NA                                 NA                 NA
## 4                 NA                                 NA                 NA
## 5                 NA                                 NA                 NA
## 6                 NA                                 NA                 NA
##   min_yaw_dumbbell amplitude_roll_dumbbell amplitude_pitch_dumbbell
## 1                                       NA                       NA
## 2                                       NA                       NA
## 3                                       NA                       NA
## 4                                       NA                       NA
## 5                                       NA                       NA
## 6                                       NA                       NA
##   amplitude_yaw_dumbbell total_accel_dumbbell var_accel_dumbbell
## 1                                          37                 NA
## 2                                          37                 NA
## 3                                          37                 NA
## 4                                          37                 NA
## 5                                          37                 NA
## 6                                          37                 NA
##   avg_roll_dumbbell stddev_roll_dumbbell var_roll_dumbbell
## 1                NA                   NA                NA
## 2                NA                   NA                NA
## 3                NA                   NA                NA
## 4                NA                   NA                NA
## 5                NA                   NA                NA
## 6                NA                   NA                NA
##   avg_pitch_dumbbell stddev_pitch_dumbbell var_pitch_dumbbell
## 1                 NA                    NA                 NA
## 2                 NA                    NA                 NA
## 3                 NA                    NA                 NA
## 4                 NA                    NA                 NA
## 5                 NA                    NA                 NA
## 6                 NA                    NA                 NA
##   avg_yaw_dumbbell stddev_yaw_dumbbell var_yaw_dumbbell gyros_dumbbell_x
## 1               NA                  NA               NA                0
## 2               NA                  NA               NA                0
## 3               NA                  NA               NA                0
## 4               NA                  NA               NA                0
## 5               NA                  NA               NA                0
## 6               NA                  NA               NA                0
##   gyros_dumbbell_y gyros_dumbbell_z accel_dumbbell_x accel_dumbbell_y
## 1            -0.02             0.00             -234               47
## 2            -0.02             0.00             -233               47
## 3            -0.02             0.00             -232               46
## 4            -0.02            -0.02             -232               48
## 5            -0.02             0.00             -233               48
## 6            -0.02             0.00             -234               48
##   accel_dumbbell_z magnet_dumbbell_x magnet_dumbbell_y magnet_dumbbell_z
## 1             -271              -559               293               -65
## 2             -269              -555               296               -64
## 3             -270              -561               298               -63
## 4             -269              -552               303               -60
## 5             -270              -554               292               -68
## 6             -269              -558               294               -66
##   roll_forearm pitch_forearm yaw_forearm kurtosis_roll_forearm
## 1         28.4         -63.9        -153                      
## 2         28.3         -63.9        -153                      
## 3         28.3         -63.9        -152                      
## 4         28.1         -63.9        -152                      
## 5         28.0         -63.9        -152                      
## 6         27.9         -63.9        -152                      
##   kurtosis_picth_forearm kurtosis_yaw_forearm skewness_roll_forearm
## 1                                                                  
## 2                                                                  
## 3                                                                  
## 4                                                                  
## 5                                                                  
## 6                                                                  
##   skewness_pitch_forearm skewness_yaw_forearm max_roll_forearm
## 1                                                           NA
## 2                                                           NA
## 3                                                           NA
## 4                                                           NA
## 5                                                           NA
## 6                                                           NA
##   max_picth_forearm max_yaw_forearm min_roll_forearm min_pitch_forearm
## 1                NA                               NA                NA
## 2                NA                               NA                NA
## 3                NA                               NA                NA
## 4                NA                               NA                NA
## 5                NA                               NA                NA
## 6                NA                               NA                NA
##   min_yaw_forearm amplitude_roll_forearm amplitude_pitch_forearm
## 1                                     NA                      NA
## 2                                     NA                      NA
## 3                                     NA                      NA
## 4                                     NA                      NA
## 5                                     NA                      NA
## 6                                     NA                      NA
##   amplitude_yaw_forearm total_accel_forearm var_accel_forearm
## 1                                        36                NA
## 2                                        36                NA
## 3                                        36                NA
## 4                                        36                NA
## 5                                        36                NA
## 6                                        36                NA
##   avg_roll_forearm stddev_roll_forearm var_roll_forearm avg_pitch_forearm
## 1               NA                  NA               NA                NA
## 2               NA                  NA               NA                NA
## 3               NA                  NA               NA                NA
## 4               NA                  NA               NA                NA
## 5               NA                  NA               NA                NA
## 6               NA                  NA               NA                NA
##   stddev_pitch_forearm var_pitch_forearm avg_yaw_forearm
## 1                   NA                NA              NA
## 2                   NA                NA              NA
## 3                   NA                NA              NA
## 4                   NA                NA              NA
## 5                   NA                NA              NA
## 6                   NA                NA              NA
##   stddev_yaw_forearm var_yaw_forearm gyros_forearm_x gyros_forearm_y
## 1                 NA              NA            0.03            0.00
## 2                 NA              NA            0.02            0.00
## 3                 NA              NA            0.03           -0.02
## 4                 NA              NA            0.02           -0.02
## 5                 NA              NA            0.02            0.00
## 6                 NA              NA            0.02           -0.02
##   gyros_forearm_z accel_forearm_x accel_forearm_y accel_forearm_z
## 1           -0.02             192             203            -215
## 2           -0.02             192             203            -216
## 3            0.00             196             204            -213
## 4            0.00             189             206            -214
## 5           -0.02             189             206            -214
## 6           -0.03             193             203            -215
##   magnet_forearm_x magnet_forearm_y magnet_forearm_z classe
## 1              -17              654              476      A
## 2              -18              661              473      A
## 3              -18              658              469      A
## 4              -16              658              469      A
## 5              -17              655              473      A
## 6               -9              660              478      A
```

```r
dim(training0)
```

```
## [1] 19622   160
```

```r
colnames(training0)
```

```
##   [1] "X"                        "user_name"               
##   [3] "raw_timestamp_part_1"     "raw_timestamp_part_2"    
##   [5] "cvtd_timestamp"           "new_window"              
##   [7] "num_window"               "roll_belt"               
##   [9] "pitch_belt"               "yaw_belt"                
##  [11] "total_accel_belt"         "kurtosis_roll_belt"      
##  [13] "kurtosis_picth_belt"      "kurtosis_yaw_belt"       
##  [15] "skewness_roll_belt"       "skewness_roll_belt.1"    
##  [17] "skewness_yaw_belt"        "max_roll_belt"           
##  [19] "max_picth_belt"           "max_yaw_belt"            
##  [21] "min_roll_belt"            "min_pitch_belt"          
##  [23] "min_yaw_belt"             "amplitude_roll_belt"     
##  [25] "amplitude_pitch_belt"     "amplitude_yaw_belt"      
##  [27] "var_total_accel_belt"     "avg_roll_belt"           
##  [29] "stddev_roll_belt"         "var_roll_belt"           
##  [31] "avg_pitch_belt"           "stddev_pitch_belt"       
##  [33] "var_pitch_belt"           "avg_yaw_belt"            
##  [35] "stddev_yaw_belt"          "var_yaw_belt"            
##  [37] "gyros_belt_x"             "gyros_belt_y"            
##  [39] "gyros_belt_z"             "accel_belt_x"            
##  [41] "accel_belt_y"             "accel_belt_z"            
##  [43] "magnet_belt_x"            "magnet_belt_y"           
##  [45] "magnet_belt_z"            "roll_arm"                
##  [47] "pitch_arm"                "yaw_arm"                 
##  [49] "total_accel_arm"          "var_accel_arm"           
##  [51] "avg_roll_arm"             "stddev_roll_arm"         
##  [53] "var_roll_arm"             "avg_pitch_arm"           
##  [55] "stddev_pitch_arm"         "var_pitch_arm"           
##  [57] "avg_yaw_arm"              "stddev_yaw_arm"          
##  [59] "var_yaw_arm"              "gyros_arm_x"             
##  [61] "gyros_arm_y"              "gyros_arm_z"             
##  [63] "accel_arm_x"              "accel_arm_y"             
##  [65] "accel_arm_z"              "magnet_arm_x"            
##  [67] "magnet_arm_y"             "magnet_arm_z"            
##  [69] "kurtosis_roll_arm"        "kurtosis_picth_arm"      
##  [71] "kurtosis_yaw_arm"         "skewness_roll_arm"       
##  [73] "skewness_pitch_arm"       "skewness_yaw_arm"        
##  [75] "max_roll_arm"             "max_picth_arm"           
##  [77] "max_yaw_arm"              "min_roll_arm"            
##  [79] "min_pitch_arm"            "min_yaw_arm"             
##  [81] "amplitude_roll_arm"       "amplitude_pitch_arm"     
##  [83] "amplitude_yaw_arm"        "roll_dumbbell"           
##  [85] "pitch_dumbbell"           "yaw_dumbbell"            
##  [87] "kurtosis_roll_dumbbell"   "kurtosis_picth_dumbbell" 
##  [89] "kurtosis_yaw_dumbbell"    "skewness_roll_dumbbell"  
##  [91] "skewness_pitch_dumbbell"  "skewness_yaw_dumbbell"   
##  [93] "max_roll_dumbbell"        "max_picth_dumbbell"      
##  [95] "max_yaw_dumbbell"         "min_roll_dumbbell"       
##  [97] "min_pitch_dumbbell"       "min_yaw_dumbbell"        
##  [99] "amplitude_roll_dumbbell"  "amplitude_pitch_dumbbell"
## [101] "amplitude_yaw_dumbbell"   "total_accel_dumbbell"    
## [103] "var_accel_dumbbell"       "avg_roll_dumbbell"       
## [105] "stddev_roll_dumbbell"     "var_roll_dumbbell"       
## [107] "avg_pitch_dumbbell"       "stddev_pitch_dumbbell"   
## [109] "var_pitch_dumbbell"       "avg_yaw_dumbbell"        
## [111] "stddev_yaw_dumbbell"      "var_yaw_dumbbell"        
## [113] "gyros_dumbbell_x"         "gyros_dumbbell_y"        
## [115] "gyros_dumbbell_z"         "accel_dumbbell_x"        
## [117] "accel_dumbbell_y"         "accel_dumbbell_z"        
## [119] "magnet_dumbbell_x"        "magnet_dumbbell_y"       
## [121] "magnet_dumbbell_z"        "roll_forearm"            
## [123] "pitch_forearm"            "yaw_forearm"             
## [125] "kurtosis_roll_forearm"    "kurtosis_picth_forearm"  
## [127] "kurtosis_yaw_forearm"     "skewness_roll_forearm"   
## [129] "skewness_pitch_forearm"   "skewness_yaw_forearm"    
## [131] "max_roll_forearm"         "max_picth_forearm"       
## [133] "max_yaw_forearm"          "min_roll_forearm"        
## [135] "min_pitch_forearm"        "min_yaw_forearm"         
## [137] "amplitude_roll_forearm"   "amplitude_pitch_forearm" 
## [139] "amplitude_yaw_forearm"    "total_accel_forearm"     
## [141] "var_accel_forearm"        "avg_roll_forearm"        
## [143] "stddev_roll_forearm"      "var_roll_forearm"        
## [145] "avg_pitch_forearm"        "stddev_pitch_forearm"    
## [147] "var_pitch_forearm"        "avg_yaw_forearm"         
## [149] "stddev_yaw_forearm"       "var_yaw_forearm"         
## [151] "gyros_forearm_x"          "gyros_forearm_y"         
## [153] "gyros_forearm_z"          "accel_forearm_x"         
## [155] "accel_forearm_y"          "accel_forearm_z"         
## [157] "magnet_forearm_x"         "magnet_forearm_y"        
## [159] "magnet_forearm_z"         "classe"
```
We see that there are tons of variables, many of which may or may not be useful. First, clearly we should remove X because it is redundant. Next we may want to delete the username, unless we have to predict for the same subjects. This would be strange because the whole point is to predict if a certain human is doing the exercise correctly not the subjects in our sample. The usernames in the training set are

```r
training0_users<-unique(training0$user_name)
```
So, before proceeding we will now load the test set to see if we are supposed to predict for the same users.

```r
url_testing <- 'https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv'
testing_data_filename<-'testing.csv'
rel_path_testing<-make_data_file_download(data_dirname,raw_data_subdirname,url_testing,testing_data_filename)
```

```
## Warning in make_data_directory(directory_name): The data directory and
## directory.log already exist.

## Warning in make_data_directory(directory_name): The data directory and
## directory.log already exist.
```

```
## Warning in make_data_sub_directory(directory_name, sub_directory_name): The
## data/raw directory already exists.
```

```
## Warning in make_data_file_download(data_dirname, raw_data_subdirname,
## url_testing, : The data/raw/testing.csv file already exists.
```
And now we load the test data

```r
testing_final<-read.csv(rel_path_testing)
head(testing_final)
```

```
##   X user_name raw_timestamp_part_1 raw_timestamp_part_2   cvtd_timestamp
## 1 1     pedro           1323095002               868349 05/12/2011 14:23
## 2 2    jeremy           1322673067               778725 30/11/2011 17:11
## 3 3    jeremy           1322673075               342967 30/11/2011 17:11
## 4 4    adelmo           1322832789               560311 02/12/2011 13:33
## 5 5    eurico           1322489635               814776 28/11/2011 14:13
## 6 6    jeremy           1322673149               510661 30/11/2011 17:12
##   new_window num_window roll_belt pitch_belt yaw_belt total_accel_belt
## 1         no         74    123.00      27.00    -4.75               20
## 2         no        431      1.02       4.87   -88.90                4
## 3         no        439      0.87       1.82   -88.50                5
## 4         no        194    125.00     -41.60   162.00               17
## 5         no        235      1.35       3.33   -88.60                3
## 6         no        504     -5.92       1.59   -87.70                4
##   kurtosis_roll_belt kurtosis_picth_belt kurtosis_yaw_belt
## 1                 NA                  NA                NA
## 2                 NA                  NA                NA
## 3                 NA                  NA                NA
## 4                 NA                  NA                NA
## 5                 NA                  NA                NA
## 6                 NA                  NA                NA
##   skewness_roll_belt skewness_roll_belt.1 skewness_yaw_belt max_roll_belt
## 1                 NA                   NA                NA            NA
## 2                 NA                   NA                NA            NA
## 3                 NA                   NA                NA            NA
## 4                 NA                   NA                NA            NA
## 5                 NA                   NA                NA            NA
## 6                 NA                   NA                NA            NA
##   max_picth_belt max_yaw_belt min_roll_belt min_pitch_belt min_yaw_belt
## 1             NA           NA            NA             NA           NA
## 2             NA           NA            NA             NA           NA
## 3             NA           NA            NA             NA           NA
## 4             NA           NA            NA             NA           NA
## 5             NA           NA            NA             NA           NA
## 6             NA           NA            NA             NA           NA
##   amplitude_roll_belt amplitude_pitch_belt amplitude_yaw_belt
## 1                  NA                   NA                 NA
## 2                  NA                   NA                 NA
## 3                  NA                   NA                 NA
## 4                  NA                   NA                 NA
## 5                  NA                   NA                 NA
## 6                  NA                   NA                 NA
##   var_total_accel_belt avg_roll_belt stddev_roll_belt var_roll_belt
## 1                   NA            NA               NA            NA
## 2                   NA            NA               NA            NA
## 3                   NA            NA               NA            NA
## 4                   NA            NA               NA            NA
## 5                   NA            NA               NA            NA
## 6                   NA            NA               NA            NA
##   avg_pitch_belt stddev_pitch_belt var_pitch_belt avg_yaw_belt
## 1             NA                NA             NA           NA
## 2             NA                NA             NA           NA
## 3             NA                NA             NA           NA
## 4             NA                NA             NA           NA
## 5             NA                NA             NA           NA
## 6             NA                NA             NA           NA
##   stddev_yaw_belt var_yaw_belt gyros_belt_x gyros_belt_y gyros_belt_z
## 1              NA           NA        -0.50        -0.02        -0.46
## 2              NA           NA        -0.06        -0.02        -0.07
## 3              NA           NA         0.05         0.02         0.03
## 4              NA           NA         0.11         0.11        -0.16
## 5              NA           NA         0.03         0.02         0.00
## 6              NA           NA         0.10         0.05        -0.13
##   accel_belt_x accel_belt_y accel_belt_z magnet_belt_x magnet_belt_y
## 1          -38           69         -179           -13           581
## 2          -13           11           39            43           636
## 3            1           -1           49            29           631
## 4           46           45         -156           169           608
## 5           -8            4           27            33           566
## 6          -11          -16           38            31           638
##   magnet_belt_z roll_arm pitch_arm yaw_arm total_accel_arm var_accel_arm
## 1          -382     40.7    -27.80     178              10            NA
## 2          -309      0.0      0.00       0              38            NA
## 3          -312      0.0      0.00       0              44            NA
## 4          -304   -109.0     55.00    -142              25            NA
## 5          -418     76.1      2.76     102              29            NA
## 6          -291      0.0      0.00       0              14            NA
##   avg_roll_arm stddev_roll_arm var_roll_arm avg_pitch_arm stddev_pitch_arm
## 1           NA              NA           NA            NA               NA
## 2           NA              NA           NA            NA               NA
## 3           NA              NA           NA            NA               NA
## 4           NA              NA           NA            NA               NA
## 5           NA              NA           NA            NA               NA
## 6           NA              NA           NA            NA               NA
##   var_pitch_arm avg_yaw_arm stddev_yaw_arm var_yaw_arm gyros_arm_x
## 1            NA          NA             NA          NA       -1.65
## 2            NA          NA             NA          NA       -1.17
## 3            NA          NA             NA          NA        2.10
## 4            NA          NA             NA          NA        0.22
## 5            NA          NA             NA          NA       -1.96
## 6            NA          NA             NA          NA        0.02
##   gyros_arm_y gyros_arm_z accel_arm_x accel_arm_y accel_arm_z magnet_arm_x
## 1        0.48       -0.18          16          38          93         -326
## 2        0.85       -0.43        -290         215         -90         -325
## 3       -1.36        1.13        -341         245         -87         -264
## 4       -0.51        0.92        -238         -57           6         -173
## 5        0.79       -0.54        -197         200         -30         -170
## 6        0.05       -0.07         -26         130         -19          396
##   magnet_arm_y magnet_arm_z kurtosis_roll_arm kurtosis_picth_arm
## 1          385          481                NA                 NA
## 2          447          434                NA                 NA
## 3          474          413                NA                 NA
## 4          257          633                NA                 NA
## 5          275          617                NA                 NA
## 6          176          516                NA                 NA
##   kurtosis_yaw_arm skewness_roll_arm skewness_pitch_arm skewness_yaw_arm
## 1               NA                NA                 NA               NA
## 2               NA                NA                 NA               NA
## 3               NA                NA                 NA               NA
## 4               NA                NA                 NA               NA
## 5               NA                NA                 NA               NA
## 6               NA                NA                 NA               NA
##   max_roll_arm max_picth_arm max_yaw_arm min_roll_arm min_pitch_arm
## 1           NA            NA          NA           NA            NA
## 2           NA            NA          NA           NA            NA
## 3           NA            NA          NA           NA            NA
## 4           NA            NA          NA           NA            NA
## 5           NA            NA          NA           NA            NA
## 6           NA            NA          NA           NA            NA
##   min_yaw_arm amplitude_roll_arm amplitude_pitch_arm amplitude_yaw_arm
## 1          NA                 NA                  NA                NA
## 2          NA                 NA                  NA                NA
## 3          NA                 NA                  NA                NA
## 4          NA                 NA                  NA                NA
## 5          NA                 NA                  NA                NA
## 6          NA                 NA                  NA                NA
##   roll_dumbbell pitch_dumbbell yaw_dumbbell kurtosis_roll_dumbbell
## 1     -17.73748       24.96085    126.23596                     NA
## 2      54.47761      -53.69758    -75.51480                     NA
## 3      57.07031      -51.37303    -75.20287                     NA
## 4      43.10927      -30.04885   -103.32003                     NA
## 5    -101.38396      -53.43952    -14.19542                     NA
## 6      62.18750      -50.55595    -71.12063                     NA
##   kurtosis_picth_dumbbell kurtosis_yaw_dumbbell skewness_roll_dumbbell
## 1                      NA                    NA                     NA
## 2                      NA                    NA                     NA
## 3                      NA                    NA                     NA
## 4                      NA                    NA                     NA
## 5                      NA                    NA                     NA
## 6                      NA                    NA                     NA
##   skewness_pitch_dumbbell skewness_yaw_dumbbell max_roll_dumbbell
## 1                      NA                    NA                NA
## 2                      NA                    NA                NA
## 3                      NA                    NA                NA
## 4                      NA                    NA                NA
## 5                      NA                    NA                NA
## 6                      NA                    NA                NA
##   max_picth_dumbbell max_yaw_dumbbell min_roll_dumbbell min_pitch_dumbbell
## 1                 NA               NA                NA                 NA
## 2                 NA               NA                NA                 NA
## 3                 NA               NA                NA                 NA
## 4                 NA               NA                NA                 NA
## 5                 NA               NA                NA                 NA
## 6                 NA               NA                NA                 NA
##   min_yaw_dumbbell amplitude_roll_dumbbell amplitude_pitch_dumbbell
## 1               NA                      NA                       NA
## 2               NA                      NA                       NA
## 3               NA                      NA                       NA
## 4               NA                      NA                       NA
## 5               NA                      NA                       NA
## 6               NA                      NA                       NA
##   amplitude_yaw_dumbbell total_accel_dumbbell var_accel_dumbbell
## 1                     NA                    9                 NA
## 2                     NA                   31                 NA
## 3                     NA                   29                 NA
## 4                     NA                   18                 NA
## 5                     NA                    4                 NA
## 6                     NA                   29                 NA
##   avg_roll_dumbbell stddev_roll_dumbbell var_roll_dumbbell
## 1                NA                   NA                NA
## 2                NA                   NA                NA
## 3                NA                   NA                NA
## 4                NA                   NA                NA
## 5                NA                   NA                NA
## 6                NA                   NA                NA
##   avg_pitch_dumbbell stddev_pitch_dumbbell var_pitch_dumbbell
## 1                 NA                    NA                 NA
## 2                 NA                    NA                 NA
## 3                 NA                    NA                 NA
## 4                 NA                    NA                 NA
## 5                 NA                    NA                 NA
## 6                 NA                    NA                 NA
##   avg_yaw_dumbbell stddev_yaw_dumbbell var_yaw_dumbbell gyros_dumbbell_x
## 1               NA                  NA               NA             0.64
## 2               NA                  NA               NA             0.34
## 3               NA                  NA               NA             0.39
## 4               NA                  NA               NA             0.10
## 5               NA                  NA               NA             0.29
## 6               NA                  NA               NA            -0.59
##   gyros_dumbbell_y gyros_dumbbell_z accel_dumbbell_x accel_dumbbell_y
## 1             0.06            -0.61               21              -15
## 2             0.05            -0.71             -153              155
## 3             0.14            -0.34             -141              155
## 4            -0.02             0.05              -51               72
## 5            -0.47            -0.46              -18              -30
## 6             0.80             1.10             -138              166
##   accel_dumbbell_z magnet_dumbbell_x magnet_dumbbell_y magnet_dumbbell_z
## 1               81               523              -528               -56
## 2             -205              -502               388               -36
## 3             -196              -506               349                41
## 4             -148              -576               238                53
## 5               -5              -424               252               312
## 6             -186              -543               262                96
##   roll_forearm pitch_forearm yaw_forearm kurtosis_roll_forearm
## 1          141         49.30       156.0                    NA
## 2          109        -17.60       106.0                    NA
## 3          131        -32.60        93.0                    NA
## 4            0          0.00         0.0                    NA
## 5         -176         -2.16       -47.9                    NA
## 6          150          1.46        89.7                    NA
##   kurtosis_picth_forearm kurtosis_yaw_forearm skewness_roll_forearm
## 1                     NA                   NA                    NA
## 2                     NA                   NA                    NA
## 3                     NA                   NA                    NA
## 4                     NA                   NA                    NA
## 5                     NA                   NA                    NA
## 6                     NA                   NA                    NA
##   skewness_pitch_forearm skewness_yaw_forearm max_roll_forearm
## 1                     NA                   NA               NA
## 2                     NA                   NA               NA
## 3                     NA                   NA               NA
## 4                     NA                   NA               NA
## 5                     NA                   NA               NA
## 6                     NA                   NA               NA
##   max_picth_forearm max_yaw_forearm min_roll_forearm min_pitch_forearm
## 1                NA              NA               NA                NA
## 2                NA              NA               NA                NA
## 3                NA              NA               NA                NA
## 4                NA              NA               NA                NA
## 5                NA              NA               NA                NA
## 6                NA              NA               NA                NA
##   min_yaw_forearm amplitude_roll_forearm amplitude_pitch_forearm
## 1              NA                     NA                      NA
## 2              NA                     NA                      NA
## 3              NA                     NA                      NA
## 4              NA                     NA                      NA
## 5              NA                     NA                      NA
## 6              NA                     NA                      NA
##   amplitude_yaw_forearm total_accel_forearm var_accel_forearm
## 1                    NA                  33                NA
## 2                    NA                  39                NA
## 3                    NA                  34                NA
## 4                    NA                  43                NA
## 5                    NA                  24                NA
## 6                    NA                  43                NA
##   avg_roll_forearm stddev_roll_forearm var_roll_forearm avg_pitch_forearm
## 1               NA                  NA               NA                NA
## 2               NA                  NA               NA                NA
## 3               NA                  NA               NA                NA
## 4               NA                  NA               NA                NA
## 5               NA                  NA               NA                NA
## 6               NA                  NA               NA                NA
##   stddev_pitch_forearm var_pitch_forearm avg_yaw_forearm
## 1                   NA                NA              NA
## 2                   NA                NA              NA
## 3                   NA                NA              NA
## 4                   NA                NA              NA
## 5                   NA                NA              NA
## 6                   NA                NA              NA
##   stddev_yaw_forearm var_yaw_forearm gyros_forearm_x gyros_forearm_y
## 1                 NA              NA            0.74           -3.34
## 2                 NA              NA            1.12           -2.78
## 3                 NA              NA            0.18           -0.79
## 4                 NA              NA            1.38            0.69
## 5                 NA              NA           -0.75            3.10
## 6                 NA              NA           -0.88            4.26
##   gyros_forearm_z accel_forearm_x accel_forearm_y accel_forearm_z
## 1           -0.59            -110             267            -149
## 2           -0.18             212             297            -118
## 3            0.28             154             271            -129
## 4            1.80             -92             406             -39
## 5            0.80             131             -93             172
## 6            1.35             230             322            -144
##   magnet_forearm_x magnet_forearm_y magnet_forearm_z problem_id
## 1             -714              419              617          1
## 2             -237              791              873          2
## 3              -51              698              783          3
## 4             -233              783              521          4
## 5              375             -787               91          5
## 6             -300              800              884          6
```

```r
dim(testing_final)
```

```
## [1]  20 160
```

```r
colnames(testing_final)
```

```
##   [1] "X"                        "user_name"               
##   [3] "raw_timestamp_part_1"     "raw_timestamp_part_2"    
##   [5] "cvtd_timestamp"           "new_window"              
##   [7] "num_window"               "roll_belt"               
##   [9] "pitch_belt"               "yaw_belt"                
##  [11] "total_accel_belt"         "kurtosis_roll_belt"      
##  [13] "kurtosis_picth_belt"      "kurtosis_yaw_belt"       
##  [15] "skewness_roll_belt"       "skewness_roll_belt.1"    
##  [17] "skewness_yaw_belt"        "max_roll_belt"           
##  [19] "max_picth_belt"           "max_yaw_belt"            
##  [21] "min_roll_belt"            "min_pitch_belt"          
##  [23] "min_yaw_belt"             "amplitude_roll_belt"     
##  [25] "amplitude_pitch_belt"     "amplitude_yaw_belt"      
##  [27] "var_total_accel_belt"     "avg_roll_belt"           
##  [29] "stddev_roll_belt"         "var_roll_belt"           
##  [31] "avg_pitch_belt"           "stddev_pitch_belt"       
##  [33] "var_pitch_belt"           "avg_yaw_belt"            
##  [35] "stddev_yaw_belt"          "var_yaw_belt"            
##  [37] "gyros_belt_x"             "gyros_belt_y"            
##  [39] "gyros_belt_z"             "accel_belt_x"            
##  [41] "accel_belt_y"             "accel_belt_z"            
##  [43] "magnet_belt_x"            "magnet_belt_y"           
##  [45] "magnet_belt_z"            "roll_arm"                
##  [47] "pitch_arm"                "yaw_arm"                 
##  [49] "total_accel_arm"          "var_accel_arm"           
##  [51] "avg_roll_arm"             "stddev_roll_arm"         
##  [53] "var_roll_arm"             "avg_pitch_arm"           
##  [55] "stddev_pitch_arm"         "var_pitch_arm"           
##  [57] "avg_yaw_arm"              "stddev_yaw_arm"          
##  [59] "var_yaw_arm"              "gyros_arm_x"             
##  [61] "gyros_arm_y"              "gyros_arm_z"             
##  [63] "accel_arm_x"              "accel_arm_y"             
##  [65] "accel_arm_z"              "magnet_arm_x"            
##  [67] "magnet_arm_y"             "magnet_arm_z"            
##  [69] "kurtosis_roll_arm"        "kurtosis_picth_arm"      
##  [71] "kurtosis_yaw_arm"         "skewness_roll_arm"       
##  [73] "skewness_pitch_arm"       "skewness_yaw_arm"        
##  [75] "max_roll_arm"             "max_picth_arm"           
##  [77] "max_yaw_arm"              "min_roll_arm"            
##  [79] "min_pitch_arm"            "min_yaw_arm"             
##  [81] "amplitude_roll_arm"       "amplitude_pitch_arm"     
##  [83] "amplitude_yaw_arm"        "roll_dumbbell"           
##  [85] "pitch_dumbbell"           "yaw_dumbbell"            
##  [87] "kurtosis_roll_dumbbell"   "kurtosis_picth_dumbbell" 
##  [89] "kurtosis_yaw_dumbbell"    "skewness_roll_dumbbell"  
##  [91] "skewness_pitch_dumbbell"  "skewness_yaw_dumbbell"   
##  [93] "max_roll_dumbbell"        "max_picth_dumbbell"      
##  [95] "max_yaw_dumbbell"         "min_roll_dumbbell"       
##  [97] "min_pitch_dumbbell"       "min_yaw_dumbbell"        
##  [99] "amplitude_roll_dumbbell"  "amplitude_pitch_dumbbell"
## [101] "amplitude_yaw_dumbbell"   "total_accel_dumbbell"    
## [103] "var_accel_dumbbell"       "avg_roll_dumbbell"       
## [105] "stddev_roll_dumbbell"     "var_roll_dumbbell"       
## [107] "avg_pitch_dumbbell"       "stddev_pitch_dumbbell"   
## [109] "var_pitch_dumbbell"       "avg_yaw_dumbbell"        
## [111] "stddev_yaw_dumbbell"      "var_yaw_dumbbell"        
## [113] "gyros_dumbbell_x"         "gyros_dumbbell_y"        
## [115] "gyros_dumbbell_z"         "accel_dumbbell_x"        
## [117] "accel_dumbbell_y"         "accel_dumbbell_z"        
## [119] "magnet_dumbbell_x"        "magnet_dumbbell_y"       
## [121] "magnet_dumbbell_z"        "roll_forearm"            
## [123] "pitch_forearm"            "yaw_forearm"             
## [125] "kurtosis_roll_forearm"    "kurtosis_picth_forearm"  
## [127] "kurtosis_yaw_forearm"     "skewness_roll_forearm"   
## [129] "skewness_pitch_forearm"   "skewness_yaw_forearm"    
## [131] "max_roll_forearm"         "max_picth_forearm"       
## [133] "max_yaw_forearm"          "min_roll_forearm"        
## [135] "min_pitch_forearm"        "min_yaw_forearm"         
## [137] "amplitude_roll_forearm"   "amplitude_pitch_forearm" 
## [139] "amplitude_yaw_forearm"    "total_accel_forearm"     
## [141] "var_accel_forearm"        "avg_roll_forearm"        
## [143] "stddev_roll_forearm"      "var_roll_forearm"        
## [145] "avg_pitch_forearm"        "stddev_pitch_forearm"    
## [147] "var_pitch_forearm"        "avg_yaw_forearm"         
## [149] "stddev_yaw_forearm"       "var_yaw_forearm"         
## [151] "gyros_forearm_x"          "gyros_forearm_y"         
## [153] "gyros_forearm_z"          "accel_forearm_x"         
## [155] "accel_forearm_y"          "accel_forearm_z"         
## [157] "magnet_forearm_x"         "magnet_forearm_y"        
## [159] "magnet_forearm_z"         "problem_id"
```

```r
testing_users<-unique(testing_final$user_name)
```

```r
sort(training0_users)==sort(testing_users)
```

```
## [1] TRUE TRUE TRUE TRUE TRUE TRUE
```
So actually! The users are indeed the same. This means that we should not remove this information - I expect it to be a strong predictor when combined with other features.

Before proceeding we have to analyse if there are features that are useless because they have no data or because they have a single value.

```r
frac_bad<-sapply(training0,function(x) sum(is.na(x))/length(x))
frac_bad
```

```
##                        X                user_name     raw_timestamp_part_1 
##                0.0000000                0.0000000                0.0000000 
##     raw_timestamp_part_2           cvtd_timestamp               new_window 
##                0.0000000                0.0000000                0.0000000 
##               num_window                roll_belt               pitch_belt 
##                0.0000000                0.0000000                0.0000000 
##                 yaw_belt         total_accel_belt       kurtosis_roll_belt 
##                0.0000000                0.0000000                0.0000000 
##      kurtosis_picth_belt        kurtosis_yaw_belt       skewness_roll_belt 
##                0.0000000                0.0000000                0.0000000 
##     skewness_roll_belt.1        skewness_yaw_belt            max_roll_belt 
##                0.0000000                0.0000000                0.9793089 
##           max_picth_belt             max_yaw_belt            min_roll_belt 
##                0.9793089                0.0000000                0.9793089 
##           min_pitch_belt             min_yaw_belt      amplitude_roll_belt 
##                0.9793089                0.0000000                0.9793089 
##     amplitude_pitch_belt       amplitude_yaw_belt     var_total_accel_belt 
##                0.9793089                0.0000000                0.9793089 
##            avg_roll_belt         stddev_roll_belt            var_roll_belt 
##                0.9793089                0.9793089                0.9793089 
##           avg_pitch_belt        stddev_pitch_belt           var_pitch_belt 
##                0.9793089                0.9793089                0.9793089 
##             avg_yaw_belt          stddev_yaw_belt             var_yaw_belt 
##                0.9793089                0.9793089                0.9793089 
##             gyros_belt_x             gyros_belt_y             gyros_belt_z 
##                0.0000000                0.0000000                0.0000000 
##             accel_belt_x             accel_belt_y             accel_belt_z 
##                0.0000000                0.0000000                0.0000000 
##            magnet_belt_x            magnet_belt_y            magnet_belt_z 
##                0.0000000                0.0000000                0.0000000 
##                 roll_arm                pitch_arm                  yaw_arm 
##                0.0000000                0.0000000                0.0000000 
##          total_accel_arm            var_accel_arm             avg_roll_arm 
##                0.0000000                0.9793089                0.9793089 
##          stddev_roll_arm             var_roll_arm            avg_pitch_arm 
##                0.9793089                0.9793089                0.9793089 
##         stddev_pitch_arm            var_pitch_arm              avg_yaw_arm 
##                0.9793089                0.9793089                0.9793089 
##           stddev_yaw_arm              var_yaw_arm              gyros_arm_x 
##                0.9793089                0.9793089                0.0000000 
##              gyros_arm_y              gyros_arm_z              accel_arm_x 
##                0.0000000                0.0000000                0.0000000 
##              accel_arm_y              accel_arm_z             magnet_arm_x 
##                0.0000000                0.0000000                0.0000000 
##             magnet_arm_y             magnet_arm_z        kurtosis_roll_arm 
##                0.0000000                0.0000000                0.0000000 
##       kurtosis_picth_arm         kurtosis_yaw_arm        skewness_roll_arm 
##                0.0000000                0.0000000                0.0000000 
##       skewness_pitch_arm         skewness_yaw_arm             max_roll_arm 
##                0.0000000                0.0000000                0.9793089 
##            max_picth_arm              max_yaw_arm             min_roll_arm 
##                0.9793089                0.9793089                0.9793089 
##            min_pitch_arm              min_yaw_arm       amplitude_roll_arm 
##                0.9793089                0.9793089                0.9793089 
##      amplitude_pitch_arm        amplitude_yaw_arm            roll_dumbbell 
##                0.9793089                0.9793089                0.0000000 
##           pitch_dumbbell             yaw_dumbbell   kurtosis_roll_dumbbell 
##                0.0000000                0.0000000                0.0000000 
##  kurtosis_picth_dumbbell    kurtosis_yaw_dumbbell   skewness_roll_dumbbell 
##                0.0000000                0.0000000                0.0000000 
##  skewness_pitch_dumbbell    skewness_yaw_dumbbell        max_roll_dumbbell 
##                0.0000000                0.0000000                0.9793089 
##       max_picth_dumbbell         max_yaw_dumbbell        min_roll_dumbbell 
##                0.9793089                0.0000000                0.9793089 
##       min_pitch_dumbbell         min_yaw_dumbbell  amplitude_roll_dumbbell 
##                0.9793089                0.0000000                0.9793089 
## amplitude_pitch_dumbbell   amplitude_yaw_dumbbell     total_accel_dumbbell 
##                0.9793089                0.0000000                0.0000000 
##       var_accel_dumbbell        avg_roll_dumbbell     stddev_roll_dumbbell 
##                0.9793089                0.9793089                0.9793089 
##        var_roll_dumbbell       avg_pitch_dumbbell    stddev_pitch_dumbbell 
##                0.9793089                0.9793089                0.9793089 
##       var_pitch_dumbbell         avg_yaw_dumbbell      stddev_yaw_dumbbell 
##                0.9793089                0.9793089                0.9793089 
##         var_yaw_dumbbell         gyros_dumbbell_x         gyros_dumbbell_y 
##                0.9793089                0.0000000                0.0000000 
##         gyros_dumbbell_z         accel_dumbbell_x         accel_dumbbell_y 
##                0.0000000                0.0000000                0.0000000 
##         accel_dumbbell_z        magnet_dumbbell_x        magnet_dumbbell_y 
##                0.0000000                0.0000000                0.0000000 
##        magnet_dumbbell_z             roll_forearm            pitch_forearm 
##                0.0000000                0.0000000                0.0000000 
##              yaw_forearm    kurtosis_roll_forearm   kurtosis_picth_forearm 
##                0.0000000                0.0000000                0.0000000 
##     kurtosis_yaw_forearm    skewness_roll_forearm   skewness_pitch_forearm 
##                0.0000000                0.0000000                0.0000000 
##     skewness_yaw_forearm         max_roll_forearm        max_picth_forearm 
##                0.0000000                0.9793089                0.9793089 
##          max_yaw_forearm         min_roll_forearm        min_pitch_forearm 
##                0.0000000                0.9793089                0.9793089 
##          min_yaw_forearm   amplitude_roll_forearm  amplitude_pitch_forearm 
##                0.0000000                0.9793089                0.9793089 
##    amplitude_yaw_forearm      total_accel_forearm        var_accel_forearm 
##                0.0000000                0.0000000                0.9793089 
##         avg_roll_forearm      stddev_roll_forearm         var_roll_forearm 
##                0.9793089                0.9793089                0.9793089 
##        avg_pitch_forearm     stddev_pitch_forearm        var_pitch_forearm 
##                0.9793089                0.9793089                0.9793089 
##          avg_yaw_forearm       stddev_yaw_forearm          var_yaw_forearm 
##                0.9793089                0.9793089                0.9793089 
##          gyros_forearm_x          gyros_forearm_y          gyros_forearm_z 
##                0.0000000                0.0000000                0.0000000 
##          accel_forearm_x          accel_forearm_y          accel_forearm_z 
##                0.0000000                0.0000000                0.0000000 
##         magnet_forearm_x         magnet_forearm_y         magnet_forearm_z 
##                0.0000000                0.0000000                0.0000000 
##                   classe 
##                0.0000000
```
We see from this that most features have no missing data and all features that have missing data have over $90\%$ missing. Those should not be good predictors so we remove them now

```r
var_keep<-character(0)
for(name in names(frac_bad)){
  if(frac_bad[name]<0.9 & name !='X'){
    var_keep<-c(var_keep,name)
  }
}
var_keep
```

```
##  [1] "user_name"               "raw_timestamp_part_1"   
##  [3] "raw_timestamp_part_2"    "cvtd_timestamp"         
##  [5] "new_window"              "num_window"             
##  [7] "roll_belt"               "pitch_belt"             
##  [9] "yaw_belt"                "total_accel_belt"       
## [11] "kurtosis_roll_belt"      "kurtosis_picth_belt"    
## [13] "kurtosis_yaw_belt"       "skewness_roll_belt"     
## [15] "skewness_roll_belt.1"    "skewness_yaw_belt"      
## [17] "max_yaw_belt"            "min_yaw_belt"           
## [19] "amplitude_yaw_belt"      "gyros_belt_x"           
## [21] "gyros_belt_y"            "gyros_belt_z"           
## [23] "accel_belt_x"            "accel_belt_y"           
## [25] "accel_belt_z"            "magnet_belt_x"          
## [27] "magnet_belt_y"           "magnet_belt_z"          
## [29] "roll_arm"                "pitch_arm"              
## [31] "yaw_arm"                 "total_accel_arm"        
## [33] "gyros_arm_x"             "gyros_arm_y"            
## [35] "gyros_arm_z"             "accel_arm_x"            
## [37] "accel_arm_y"             "accel_arm_z"            
## [39] "magnet_arm_x"            "magnet_arm_y"           
## [41] "magnet_arm_z"            "kurtosis_roll_arm"      
## [43] "kurtosis_picth_arm"      "kurtosis_yaw_arm"       
## [45] "skewness_roll_arm"       "skewness_pitch_arm"     
## [47] "skewness_yaw_arm"        "roll_dumbbell"          
## [49] "pitch_dumbbell"          "yaw_dumbbell"           
## [51] "kurtosis_roll_dumbbell"  "kurtosis_picth_dumbbell"
## [53] "kurtosis_yaw_dumbbell"   "skewness_roll_dumbbell" 
## [55] "skewness_pitch_dumbbell" "skewness_yaw_dumbbell"  
## [57] "max_yaw_dumbbell"        "min_yaw_dumbbell"       
## [59] "amplitude_yaw_dumbbell"  "total_accel_dumbbell"   
## [61] "gyros_dumbbell_x"        "gyros_dumbbell_y"       
## [63] "gyros_dumbbell_z"        "accel_dumbbell_x"       
## [65] "accel_dumbbell_y"        "accel_dumbbell_z"       
## [67] "magnet_dumbbell_x"       "magnet_dumbbell_y"      
## [69] "magnet_dumbbell_z"       "roll_forearm"           
## [71] "pitch_forearm"           "yaw_forearm"            
## [73] "kurtosis_roll_forearm"   "kurtosis_picth_forearm" 
## [75] "kurtosis_yaw_forearm"    "skewness_roll_forearm"  
## [77] "skewness_pitch_forearm"  "skewness_yaw_forearm"   
## [79] "max_yaw_forearm"         "min_yaw_forearm"        
## [81] "amplitude_yaw_forearm"   "total_accel_forearm"    
## [83] "gyros_forearm_x"         "gyros_forearm_y"        
## [85] "gyros_forearm_z"         "accel_forearm_x"        
## [87] "accel_forearm_y"         "accel_forearm_z"        
## [89] "magnet_forearm_x"        "magnet_forearm_y"       
## [91] "magnet_forearm_z"        "classe"
```

```r
training0_keep1<-training0[,var_keep]
head(training0_keep1)
```

```
##   user_name raw_timestamp_part_1 raw_timestamp_part_2   cvtd_timestamp
## 1  carlitos           1323084231               788290 05/12/2011 11:23
## 2  carlitos           1323084231               808298 05/12/2011 11:23
## 3  carlitos           1323084231               820366 05/12/2011 11:23
## 4  carlitos           1323084232               120339 05/12/2011 11:23
## 5  carlitos           1323084232               196328 05/12/2011 11:23
## 6  carlitos           1323084232               304277 05/12/2011 11:23
##   new_window num_window roll_belt pitch_belt yaw_belt total_accel_belt
## 1         no         11      1.41       8.07    -94.4                3
## 2         no         11      1.41       8.07    -94.4                3
## 3         no         11      1.42       8.07    -94.4                3
## 4         no         12      1.48       8.05    -94.4                3
## 5         no         12      1.48       8.07    -94.4                3
## 6         no         12      1.45       8.06    -94.4                3
##   kurtosis_roll_belt kurtosis_picth_belt kurtosis_yaw_belt
## 1                                                         
## 2                                                         
## 3                                                         
## 4                                                         
## 5                                                         
## 6                                                         
##   skewness_roll_belt skewness_roll_belt.1 skewness_yaw_belt max_yaw_belt
## 1                                                                       
## 2                                                                       
## 3                                                                       
## 4                                                                       
## 5                                                                       
## 6                                                                       
##   min_yaw_belt amplitude_yaw_belt gyros_belt_x gyros_belt_y gyros_belt_z
## 1                                         0.00         0.00        -0.02
## 2                                         0.02         0.00        -0.02
## 3                                         0.00         0.00        -0.02
## 4                                         0.02         0.00        -0.03
## 5                                         0.02         0.02        -0.02
## 6                                         0.02         0.00        -0.02
##   accel_belt_x accel_belt_y accel_belt_z magnet_belt_x magnet_belt_y
## 1          -21            4           22            -3           599
## 2          -22            4           22            -7           608
## 3          -20            5           23            -2           600
## 4          -22            3           21            -6           604
## 5          -21            2           24            -6           600
## 6          -21            4           21             0           603
##   magnet_belt_z roll_arm pitch_arm yaw_arm total_accel_arm gyros_arm_x
## 1          -313     -128      22.5    -161              34        0.00
## 2          -311     -128      22.5    -161              34        0.02
## 3          -305     -128      22.5    -161              34        0.02
## 4          -310     -128      22.1    -161              34        0.02
## 5          -302     -128      22.1    -161              34        0.00
## 6          -312     -128      22.0    -161              34        0.02
##   gyros_arm_y gyros_arm_z accel_arm_x accel_arm_y accel_arm_z magnet_arm_x
## 1        0.00       -0.02        -288         109        -123         -368
## 2       -0.02       -0.02        -290         110        -125         -369
## 3       -0.02       -0.02        -289         110        -126         -368
## 4       -0.03        0.02        -289         111        -123         -372
## 5       -0.03        0.00        -289         111        -123         -374
## 6       -0.03        0.00        -289         111        -122         -369
##   magnet_arm_y magnet_arm_z kurtosis_roll_arm kurtosis_picth_arm
## 1          337          516                                     
## 2          337          513                                     
## 3          344          513                                     
## 4          344          512                                     
## 5          337          506                                     
## 6          342          513                                     
##   kurtosis_yaw_arm skewness_roll_arm skewness_pitch_arm skewness_yaw_arm
## 1                                                                       
## 2                                                                       
## 3                                                                       
## 4                                                                       
## 5                                                                       
## 6                                                                       
##   roll_dumbbell pitch_dumbbell yaw_dumbbell kurtosis_roll_dumbbell
## 1      13.05217      -70.49400    -84.87394                       
## 2      13.13074      -70.63751    -84.71065                       
## 3      12.85075      -70.27812    -85.14078                       
## 4      13.43120      -70.39379    -84.87363                       
## 5      13.37872      -70.42856    -84.85306                       
## 6      13.38246      -70.81759    -84.46500                       
##   kurtosis_picth_dumbbell kurtosis_yaw_dumbbell skewness_roll_dumbbell
## 1                                                                     
## 2                                                                     
## 3                                                                     
## 4                                                                     
## 5                                                                     
## 6                                                                     
##   skewness_pitch_dumbbell skewness_yaw_dumbbell max_yaw_dumbbell
## 1                                                               
## 2                                                               
## 3                                                               
## 4                                                               
## 5                                                               
## 6                                                               
##   min_yaw_dumbbell amplitude_yaw_dumbbell total_accel_dumbbell
## 1                                                           37
## 2                                                           37
## 3                                                           37
## 4                                                           37
## 5                                                           37
## 6                                                           37
##   gyros_dumbbell_x gyros_dumbbell_y gyros_dumbbell_z accel_dumbbell_x
## 1                0            -0.02             0.00             -234
## 2                0            -0.02             0.00             -233
## 3                0            -0.02             0.00             -232
## 4                0            -0.02            -0.02             -232
## 5                0            -0.02             0.00             -233
## 6                0            -0.02             0.00             -234
##   accel_dumbbell_y accel_dumbbell_z magnet_dumbbell_x magnet_dumbbell_y
## 1               47             -271              -559               293
## 2               47             -269              -555               296
## 3               46             -270              -561               298
## 4               48             -269              -552               303
## 5               48             -270              -554               292
## 6               48             -269              -558               294
##   magnet_dumbbell_z roll_forearm pitch_forearm yaw_forearm
## 1               -65         28.4         -63.9        -153
## 2               -64         28.3         -63.9        -153
## 3               -63         28.3         -63.9        -152
## 4               -60         28.1         -63.9        -152
## 5               -68         28.0         -63.9        -152
## 6               -66         27.9         -63.9        -152
##   kurtosis_roll_forearm kurtosis_picth_forearm kurtosis_yaw_forearm
## 1                                                                  
## 2                                                                  
## 3                                                                  
## 4                                                                  
## 5                                                                  
## 6                                                                  
##   skewness_roll_forearm skewness_pitch_forearm skewness_yaw_forearm
## 1                                                                  
## 2                                                                  
## 3                                                                  
## 4                                                                  
## 5                                                                  
## 6                                                                  
##   max_yaw_forearm min_yaw_forearm amplitude_yaw_forearm
## 1                                                      
## 2                                                      
## 3                                                      
## 4                                                      
## 5                                                      
## 6                                                      
##   total_accel_forearm gyros_forearm_x gyros_forearm_y gyros_forearm_z
## 1                  36            0.03            0.00           -0.02
## 2                  36            0.02            0.00           -0.02
## 3                  36            0.03           -0.02            0.00
## 4                  36            0.02           -0.02            0.00
## 5                  36            0.02            0.00           -0.02
## 6                  36            0.02           -0.02           -0.03
##   accel_forearm_x accel_forearm_y accel_forearm_z magnet_forearm_x
## 1             192             203            -215              -17
## 2             192             203            -216              -18
## 3             196             204            -213              -18
## 4             189             206            -214              -16
## 5             189             206            -214              -17
## 6             193             203            -215               -9
##   magnet_forearm_y magnet_forearm_z classe
## 1              654              476      A
## 2              661              473      A
## 3              658              469      A
## 4              658              469      A
## 5              655              473      A
## 6              660              478      A
```
We can still see that there are lots of variables with empty values (even if not specifically NA). So we need to identify further variables to remove. We follow the same procedure but now identify, instead of NA values, empty strings.


```r
empty_char <-function(x){
  x==''
}
frac_bad2<-sapply(training0_keep1,function(x) sum(empty_char (x))/length(x))
frac_bad2
```

```
##               user_name    raw_timestamp_part_1    raw_timestamp_part_2 
##               0.0000000               0.0000000               0.0000000 
##          cvtd_timestamp              new_window              num_window 
##               0.0000000               0.0000000               0.0000000 
##               roll_belt              pitch_belt                yaw_belt 
##               0.0000000               0.0000000               0.0000000 
##        total_accel_belt      kurtosis_roll_belt     kurtosis_picth_belt 
##               0.0000000               0.9793089               0.9793089 
##       kurtosis_yaw_belt      skewness_roll_belt    skewness_roll_belt.1 
##               0.9793089               0.9793089               0.9793089 
##       skewness_yaw_belt            max_yaw_belt            min_yaw_belt 
##               0.9793089               0.9793089               0.9793089 
##      amplitude_yaw_belt            gyros_belt_x            gyros_belt_y 
##               0.9793089               0.0000000               0.0000000 
##            gyros_belt_z            accel_belt_x            accel_belt_y 
##               0.0000000               0.0000000               0.0000000 
##            accel_belt_z           magnet_belt_x           magnet_belt_y 
##               0.0000000               0.0000000               0.0000000 
##           magnet_belt_z                roll_arm               pitch_arm 
##               0.0000000               0.0000000               0.0000000 
##                 yaw_arm         total_accel_arm             gyros_arm_x 
##               0.0000000               0.0000000               0.0000000 
##             gyros_arm_y             gyros_arm_z             accel_arm_x 
##               0.0000000               0.0000000               0.0000000 
##             accel_arm_y             accel_arm_z            magnet_arm_x 
##               0.0000000               0.0000000               0.0000000 
##            magnet_arm_y            magnet_arm_z       kurtosis_roll_arm 
##               0.0000000               0.0000000               0.9793089 
##      kurtosis_picth_arm        kurtosis_yaw_arm       skewness_roll_arm 
##               0.9793089               0.9793089               0.9793089 
##      skewness_pitch_arm        skewness_yaw_arm           roll_dumbbell 
##               0.9793089               0.9793089               0.0000000 
##          pitch_dumbbell            yaw_dumbbell  kurtosis_roll_dumbbell 
##               0.0000000               0.0000000               0.9793089 
## kurtosis_picth_dumbbell   kurtosis_yaw_dumbbell  skewness_roll_dumbbell 
##               0.9793089               0.9793089               0.9793089 
## skewness_pitch_dumbbell   skewness_yaw_dumbbell        max_yaw_dumbbell 
##               0.9793089               0.9793089               0.9793089 
##        min_yaw_dumbbell  amplitude_yaw_dumbbell    total_accel_dumbbell 
##               0.9793089               0.9793089               0.0000000 
##        gyros_dumbbell_x        gyros_dumbbell_y        gyros_dumbbell_z 
##               0.0000000               0.0000000               0.0000000 
##        accel_dumbbell_x        accel_dumbbell_y        accel_dumbbell_z 
##               0.0000000               0.0000000               0.0000000 
##       magnet_dumbbell_x       magnet_dumbbell_y       magnet_dumbbell_z 
##               0.0000000               0.0000000               0.0000000 
##            roll_forearm           pitch_forearm             yaw_forearm 
##               0.0000000               0.0000000               0.0000000 
##   kurtosis_roll_forearm  kurtosis_picth_forearm    kurtosis_yaw_forearm 
##               0.9793089               0.9793089               0.9793089 
##   skewness_roll_forearm  skewness_pitch_forearm    skewness_yaw_forearm 
##               0.9793089               0.9793089               0.9793089 
##         max_yaw_forearm         min_yaw_forearm   amplitude_yaw_forearm 
##               0.9793089               0.9793089               0.9793089 
##     total_accel_forearm         gyros_forearm_x         gyros_forearm_y 
##               0.0000000               0.0000000               0.0000000 
##         gyros_forearm_z         accel_forearm_x         accel_forearm_y 
##               0.0000000               0.0000000               0.0000000 
##         accel_forearm_z        magnet_forearm_x        magnet_forearm_y 
##               0.0000000               0.0000000               0.0000000 
##        magnet_forearm_z                  classe 
##               0.0000000               0.0000000
```


```r
var_keep2<-character(0)
for(name in names(frac_bad2)){
  if(frac_bad2[name]<0.9){
    var_keep2<-c(var_keep2,name)
  }
}
var_keep2
```

```
##  [1] "user_name"            "raw_timestamp_part_1" "raw_timestamp_part_2"
##  [4] "cvtd_timestamp"       "new_window"           "num_window"          
##  [7] "roll_belt"            "pitch_belt"           "yaw_belt"            
## [10] "total_accel_belt"     "gyros_belt_x"         "gyros_belt_y"        
## [13] "gyros_belt_z"         "accel_belt_x"         "accel_belt_y"        
## [16] "accel_belt_z"         "magnet_belt_x"        "magnet_belt_y"       
## [19] "magnet_belt_z"        "roll_arm"             "pitch_arm"           
## [22] "yaw_arm"              "total_accel_arm"      "gyros_arm_x"         
## [25] "gyros_arm_y"          "gyros_arm_z"          "accel_arm_x"         
## [28] "accel_arm_y"          "accel_arm_z"          "magnet_arm_x"        
## [31] "magnet_arm_y"         "magnet_arm_z"         "roll_dumbbell"       
## [34] "pitch_dumbbell"       "yaw_dumbbell"         "total_accel_dumbbell"
## [37] "gyros_dumbbell_x"     "gyros_dumbbell_y"     "gyros_dumbbell_z"    
## [40] "accel_dumbbell_x"     "accel_dumbbell_y"     "accel_dumbbell_z"    
## [43] "magnet_dumbbell_x"    "magnet_dumbbell_y"    "magnet_dumbbell_z"   
## [46] "roll_forearm"         "pitch_forearm"        "yaw_forearm"         
## [49] "total_accel_forearm"  "gyros_forearm_x"      "gyros_forearm_y"     
## [52] "gyros_forearm_z"      "accel_forearm_x"      "accel_forearm_y"     
## [55] "accel_forearm_z"      "magnet_forearm_x"     "magnet_forearm_y"    
## [58] "magnet_forearm_z"     "classe"
```
Now we keep only these features

```r
training0_keep2<-training0[,var_keep2]
head(training0_keep2)
```

```
##   user_name raw_timestamp_part_1 raw_timestamp_part_2   cvtd_timestamp
## 1  carlitos           1323084231               788290 05/12/2011 11:23
## 2  carlitos           1323084231               808298 05/12/2011 11:23
## 3  carlitos           1323084231               820366 05/12/2011 11:23
## 4  carlitos           1323084232               120339 05/12/2011 11:23
## 5  carlitos           1323084232               196328 05/12/2011 11:23
## 6  carlitos           1323084232               304277 05/12/2011 11:23
##   new_window num_window roll_belt pitch_belt yaw_belt total_accel_belt
## 1         no         11      1.41       8.07    -94.4                3
## 2         no         11      1.41       8.07    -94.4                3
## 3         no         11      1.42       8.07    -94.4                3
## 4         no         12      1.48       8.05    -94.4                3
## 5         no         12      1.48       8.07    -94.4                3
## 6         no         12      1.45       8.06    -94.4                3
##   gyros_belt_x gyros_belt_y gyros_belt_z accel_belt_x accel_belt_y
## 1         0.00         0.00        -0.02          -21            4
## 2         0.02         0.00        -0.02          -22            4
## 3         0.00         0.00        -0.02          -20            5
## 4         0.02         0.00        -0.03          -22            3
## 5         0.02         0.02        -0.02          -21            2
## 6         0.02         0.00        -0.02          -21            4
##   accel_belt_z magnet_belt_x magnet_belt_y magnet_belt_z roll_arm
## 1           22            -3           599          -313     -128
## 2           22            -7           608          -311     -128
## 3           23            -2           600          -305     -128
## 4           21            -6           604          -310     -128
## 5           24            -6           600          -302     -128
## 6           21             0           603          -312     -128
##   pitch_arm yaw_arm total_accel_arm gyros_arm_x gyros_arm_y gyros_arm_z
## 1      22.5    -161              34        0.00        0.00       -0.02
## 2      22.5    -161              34        0.02       -0.02       -0.02
## 3      22.5    -161              34        0.02       -0.02       -0.02
## 4      22.1    -161              34        0.02       -0.03        0.02
## 5      22.1    -161              34        0.00       -0.03        0.00
## 6      22.0    -161              34        0.02       -0.03        0.00
##   accel_arm_x accel_arm_y accel_arm_z magnet_arm_x magnet_arm_y
## 1        -288         109        -123         -368          337
## 2        -290         110        -125         -369          337
## 3        -289         110        -126         -368          344
## 4        -289         111        -123         -372          344
## 5        -289         111        -123         -374          337
## 6        -289         111        -122         -369          342
##   magnet_arm_z roll_dumbbell pitch_dumbbell yaw_dumbbell
## 1          516      13.05217      -70.49400    -84.87394
## 2          513      13.13074      -70.63751    -84.71065
## 3          513      12.85075      -70.27812    -85.14078
## 4          512      13.43120      -70.39379    -84.87363
## 5          506      13.37872      -70.42856    -84.85306
## 6          513      13.38246      -70.81759    -84.46500
##   total_accel_dumbbell gyros_dumbbell_x gyros_dumbbell_y gyros_dumbbell_z
## 1                   37                0            -0.02             0.00
## 2                   37                0            -0.02             0.00
## 3                   37                0            -0.02             0.00
## 4                   37                0            -0.02            -0.02
## 5                   37                0            -0.02             0.00
## 6                   37                0            -0.02             0.00
##   accel_dumbbell_x accel_dumbbell_y accel_dumbbell_z magnet_dumbbell_x
## 1             -234               47             -271              -559
## 2             -233               47             -269              -555
## 3             -232               46             -270              -561
## 4             -232               48             -269              -552
## 5             -233               48             -270              -554
## 6             -234               48             -269              -558
##   magnet_dumbbell_y magnet_dumbbell_z roll_forearm pitch_forearm
## 1               293               -65         28.4         -63.9
## 2               296               -64         28.3         -63.9
## 3               298               -63         28.3         -63.9
## 4               303               -60         28.1         -63.9
## 5               292               -68         28.0         -63.9
## 6               294               -66         27.9         -63.9
##   yaw_forearm total_accel_forearm gyros_forearm_x gyros_forearm_y
## 1        -153                  36            0.03            0.00
## 2        -153                  36            0.02            0.00
## 3        -152                  36            0.03           -0.02
## 4        -152                  36            0.02           -0.02
## 5        -152                  36            0.02            0.00
## 6        -152                  36            0.02           -0.02
##   gyros_forearm_z accel_forearm_x accel_forearm_y accel_forearm_z
## 1           -0.02             192             203            -215
## 2           -0.02             192             203            -216
## 3            0.00             196             204            -213
## 4            0.00             189             206            -214
## 5           -0.02             189             206            -214
## 6           -0.03             193             203            -215
##   magnet_forearm_x magnet_forearm_y magnet_forearm_z classe
## 1              -17              654              476      A
## 2              -18              661              473      A
## 3              -18              658              469      A
## 4              -16              658              469      A
## 5              -17              655              473      A
## 6               -9              660              478      A
```
Now we need to understand the remaining features. 

```r
summary(training0_keep2)
```

```
##     user_name    raw_timestamp_part_1 raw_timestamp_part_2
##  adelmo  :3892   Min.   :1.322e+09    Min.   :   294      
##  carlitos:3112   1st Qu.:1.323e+09    1st Qu.:252912      
##  charles :3536   Median :1.323e+09    Median :496380      
##  eurico  :3070   Mean   :1.323e+09    Mean   :500656      
##  jeremy  :3402   3rd Qu.:1.323e+09    3rd Qu.:751891      
##  pedro   :2610   Max.   :1.323e+09    Max.   :998801      
##                                                           
##           cvtd_timestamp  new_window    num_window      roll_belt     
##  28/11/2011 14:14: 1498   no :19216   Min.   :  1.0   Min.   :-28.90  
##  05/12/2011 11:24: 1497   yes:  406   1st Qu.:222.0   1st Qu.:  1.10  
##  30/11/2011 17:11: 1440               Median :424.0   Median :113.00  
##  05/12/2011 11:25: 1425               Mean   :430.6   Mean   : 64.41  
##  02/12/2011 14:57: 1380               3rd Qu.:644.0   3rd Qu.:123.00  
##  02/12/2011 13:34: 1375               Max.   :864.0   Max.   :162.00  
##  (Other)         :11007                                               
##    pitch_belt          yaw_belt       total_accel_belt  gyros_belt_x      
##  Min.   :-55.8000   Min.   :-180.00   Min.   : 0.00    Min.   :-1.040000  
##  1st Qu.:  1.7600   1st Qu.: -88.30   1st Qu.: 3.00    1st Qu.:-0.030000  
##  Median :  5.2800   Median : -13.00   Median :17.00    Median : 0.030000  
##  Mean   :  0.3053   Mean   : -11.21   Mean   :11.31    Mean   :-0.005592  
##  3rd Qu.: 14.9000   3rd Qu.:  12.90   3rd Qu.:18.00    3rd Qu.: 0.110000  
##  Max.   : 60.3000   Max.   : 179.00   Max.   :29.00    Max.   : 2.220000  
##                                                                           
##   gyros_belt_y       gyros_belt_z      accel_belt_x       accel_belt_y   
##  Min.   :-0.64000   Min.   :-1.4600   Min.   :-120.000   Min.   :-69.00  
##  1st Qu.: 0.00000   1st Qu.:-0.2000   1st Qu.: -21.000   1st Qu.:  3.00  
##  Median : 0.02000   Median :-0.1000   Median : -15.000   Median : 35.00  
##  Mean   : 0.03959   Mean   :-0.1305   Mean   :  -5.595   Mean   : 30.15  
##  3rd Qu.: 0.11000   3rd Qu.:-0.0200   3rd Qu.:  -5.000   3rd Qu.: 61.00  
##  Max.   : 0.64000   Max.   : 1.6200   Max.   :  85.000   Max.   :164.00  
##                                                                          
##   accel_belt_z     magnet_belt_x   magnet_belt_y   magnet_belt_z   
##  Min.   :-275.00   Min.   :-52.0   Min.   :354.0   Min.   :-623.0  
##  1st Qu.:-162.00   1st Qu.:  9.0   1st Qu.:581.0   1st Qu.:-375.0  
##  Median :-152.00   Median : 35.0   Median :601.0   Median :-320.0  
##  Mean   : -72.59   Mean   : 55.6   Mean   :593.7   Mean   :-345.5  
##  3rd Qu.:  27.00   3rd Qu.: 59.0   3rd Qu.:610.0   3rd Qu.:-306.0  
##  Max.   : 105.00   Max.   :485.0   Max.   :673.0   Max.   : 293.0  
##                                                                    
##     roll_arm         pitch_arm          yaw_arm          total_accel_arm
##  Min.   :-180.00   Min.   :-88.800   Min.   :-180.0000   Min.   : 1.00  
##  1st Qu.: -31.77   1st Qu.:-25.900   1st Qu.: -43.1000   1st Qu.:17.00  
##  Median :   0.00   Median :  0.000   Median :   0.0000   Median :27.00  
##  Mean   :  17.83   Mean   : -4.612   Mean   :  -0.6188   Mean   :25.51  
##  3rd Qu.:  77.30   3rd Qu.: 11.200   3rd Qu.:  45.8750   3rd Qu.:33.00  
##  Max.   : 180.00   Max.   : 88.500   Max.   : 180.0000   Max.   :66.00  
##                                                                         
##   gyros_arm_x        gyros_arm_y       gyros_arm_z       accel_arm_x     
##  Min.   :-6.37000   Min.   :-3.4400   Min.   :-2.3300   Min.   :-404.00  
##  1st Qu.:-1.33000   1st Qu.:-0.8000   1st Qu.:-0.0700   1st Qu.:-242.00  
##  Median : 0.08000   Median :-0.2400   Median : 0.2300   Median : -44.00  
##  Mean   : 0.04277   Mean   :-0.2571   Mean   : 0.2695   Mean   : -60.24  
##  3rd Qu.: 1.57000   3rd Qu.: 0.1400   3rd Qu.: 0.7200   3rd Qu.:  84.00  
##  Max.   : 4.87000   Max.   : 2.8400   Max.   : 3.0200   Max.   : 437.00  
##                                                                          
##   accel_arm_y      accel_arm_z       magnet_arm_x     magnet_arm_y   
##  Min.   :-318.0   Min.   :-636.00   Min.   :-584.0   Min.   :-392.0  
##  1st Qu.: -54.0   1st Qu.:-143.00   1st Qu.:-300.0   1st Qu.:  -9.0  
##  Median :  14.0   Median : -47.00   Median : 289.0   Median : 202.0  
##  Mean   :  32.6   Mean   : -71.25   Mean   : 191.7   Mean   : 156.6  
##  3rd Qu.: 139.0   3rd Qu.:  23.00   3rd Qu.: 637.0   3rd Qu.: 323.0  
##  Max.   : 308.0   Max.   : 292.00   Max.   : 782.0   Max.   : 583.0  
##                                                                      
##   magnet_arm_z    roll_dumbbell     pitch_dumbbell     yaw_dumbbell     
##  Min.   :-597.0   Min.   :-153.71   Min.   :-149.59   Min.   :-150.871  
##  1st Qu.: 131.2   1st Qu.: -18.49   1st Qu.: -40.89   1st Qu.: -77.644  
##  Median : 444.0   Median :  48.17   Median : -20.96   Median :  -3.324  
##  Mean   : 306.5   Mean   :  23.84   Mean   : -10.78   Mean   :   1.674  
##  3rd Qu.: 545.0   3rd Qu.:  67.61   3rd Qu.:  17.50   3rd Qu.:  79.643  
##  Max.   : 694.0   Max.   : 153.55   Max.   : 149.40   Max.   : 154.952  
##                                                                         
##  total_accel_dumbbell gyros_dumbbell_x    gyros_dumbbell_y  
##  Min.   : 0.00        Min.   :-204.0000   Min.   :-2.10000  
##  1st Qu.: 4.00        1st Qu.:  -0.0300   1st Qu.:-0.14000  
##  Median :10.00        Median :   0.1300   Median : 0.03000  
##  Mean   :13.72        Mean   :   0.1611   Mean   : 0.04606  
##  3rd Qu.:19.00        3rd Qu.:   0.3500   3rd Qu.: 0.21000  
##  Max.   :58.00        Max.   :   2.2200   Max.   :52.00000  
##                                                             
##  gyros_dumbbell_z  accel_dumbbell_x  accel_dumbbell_y  accel_dumbbell_z 
##  Min.   : -2.380   Min.   :-419.00   Min.   :-189.00   Min.   :-334.00  
##  1st Qu.: -0.310   1st Qu.: -50.00   1st Qu.:  -8.00   1st Qu.:-142.00  
##  Median : -0.130   Median :  -8.00   Median :  41.50   Median :  -1.00  
##  Mean   : -0.129   Mean   : -28.62   Mean   :  52.63   Mean   : -38.32  
##  3rd Qu.:  0.030   3rd Qu.:  11.00   3rd Qu.: 111.00   3rd Qu.:  38.00  
##  Max.   :317.000   Max.   : 235.00   Max.   : 315.00   Max.   : 318.00  
##                                                                         
##  magnet_dumbbell_x magnet_dumbbell_y magnet_dumbbell_z  roll_forearm      
##  Min.   :-643.0    Min.   :-3600     Min.   :-262.00   Min.   :-180.0000  
##  1st Qu.:-535.0    1st Qu.:  231     1st Qu.: -45.00   1st Qu.:  -0.7375  
##  Median :-479.0    Median :  311     Median :  13.00   Median :  21.7000  
##  Mean   :-328.5    Mean   :  221     Mean   :  46.05   Mean   :  33.8265  
##  3rd Qu.:-304.0    3rd Qu.:  390     3rd Qu.:  95.00   3rd Qu.: 140.0000  
##  Max.   : 592.0    Max.   :  633     Max.   : 452.00   Max.   : 180.0000  
##                                                                           
##  pitch_forearm     yaw_forearm      total_accel_forearm gyros_forearm_x  
##  Min.   :-72.50   Min.   :-180.00   Min.   :  0.00      Min.   :-22.000  
##  1st Qu.:  0.00   1st Qu.: -68.60   1st Qu.: 29.00      1st Qu.: -0.220  
##  Median :  9.24   Median :   0.00   Median : 36.00      Median :  0.050  
##  Mean   : 10.71   Mean   :  19.21   Mean   : 34.72      Mean   :  0.158  
##  3rd Qu.: 28.40   3rd Qu.: 110.00   3rd Qu.: 41.00      3rd Qu.:  0.560  
##  Max.   : 89.80   Max.   : 180.00   Max.   :108.00      Max.   :  3.970  
##                                                                          
##  gyros_forearm_y     gyros_forearm_z    accel_forearm_x   accel_forearm_y 
##  Min.   : -7.02000   Min.   : -8.0900   Min.   :-498.00   Min.   :-632.0  
##  1st Qu.: -1.46000   1st Qu.: -0.1800   1st Qu.:-178.00   1st Qu.:  57.0  
##  Median :  0.03000   Median :  0.0800   Median : -57.00   Median : 201.0  
##  Mean   :  0.07517   Mean   :  0.1512   Mean   : -61.65   Mean   : 163.7  
##  3rd Qu.:  1.62000   3rd Qu.:  0.4900   3rd Qu.:  76.00   3rd Qu.: 312.0  
##  Max.   :311.00000   Max.   :231.0000   Max.   : 477.00   Max.   : 923.0  
##                                                                           
##  accel_forearm_z   magnet_forearm_x  magnet_forearm_y magnet_forearm_z
##  Min.   :-446.00   Min.   :-1280.0   Min.   :-896.0   Min.   :-973.0  
##  1st Qu.:-182.00   1st Qu.: -616.0   1st Qu.:   2.0   1st Qu.: 191.0  
##  Median : -39.00   Median : -378.0   Median : 591.0   Median : 511.0  
##  Mean   : -55.29   Mean   : -312.6   Mean   : 380.1   Mean   : 393.6  
##  3rd Qu.:  26.00   3rd Qu.:  -73.0   3rd Qu.: 737.0   3rd Qu.: 653.0  
##  Max.   : 291.00   Max.   :  672.0   Max.   :1480.0   Max.   :1090.0  
##                                                                       
##  classe  
##  A:5580  
##  B:3797  
##  C:3422  
##  D:3216  
##  E:3607  
##          
## 
```

```r
str(training0_keep2)
```

```
## 'data.frame':	19622 obs. of  59 variables:
##  $ user_name           : Factor w/ 6 levels "adelmo","carlitos",..: 2 2 2 2 2 2 2 2 2 2 ...
##  $ raw_timestamp_part_1: int  1323084231 1323084231 1323084231 1323084232 1323084232 1323084232 1323084232 1323084232 1323084232 1323084232 ...
##  $ raw_timestamp_part_2: int  788290 808298 820366 120339 196328 304277 368296 440390 484323 484434 ...
##  $ cvtd_timestamp      : Factor w/ 20 levels "02/12/2011 13:32",..: 9 9 9 9 9 9 9 9 9 9 ...
##  $ new_window          : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
##  $ num_window          : int  11 11 11 12 12 12 12 12 12 12 ...
##  $ roll_belt           : num  1.41 1.41 1.42 1.48 1.48 1.45 1.42 1.42 1.43 1.45 ...
##  $ pitch_belt          : num  8.07 8.07 8.07 8.05 8.07 8.06 8.09 8.13 8.16 8.17 ...
##  $ yaw_belt            : num  -94.4 -94.4 -94.4 -94.4 -94.4 -94.4 -94.4 -94.4 -94.4 -94.4 ...
##  $ total_accel_belt    : int  3 3 3 3 3 3 3 3 3 3 ...
##  $ gyros_belt_x        : num  0 0.02 0 0.02 0.02 0.02 0.02 0.02 0.02 0.03 ...
##  $ gyros_belt_y        : num  0 0 0 0 0.02 0 0 0 0 0 ...
##  $ gyros_belt_z        : num  -0.02 -0.02 -0.02 -0.03 -0.02 -0.02 -0.02 -0.02 -0.02 0 ...
##  $ accel_belt_x        : int  -21 -22 -20 -22 -21 -21 -22 -22 -20 -21 ...
##  $ accel_belt_y        : int  4 4 5 3 2 4 3 4 2 4 ...
##  $ accel_belt_z        : int  22 22 23 21 24 21 21 21 24 22 ...
##  $ magnet_belt_x       : int  -3 -7 -2 -6 -6 0 -4 -2 1 -3 ...
##  $ magnet_belt_y       : int  599 608 600 604 600 603 599 603 602 609 ...
##  $ magnet_belt_z       : int  -313 -311 -305 -310 -302 -312 -311 -313 -312 -308 ...
##  $ roll_arm            : num  -128 -128 -128 -128 -128 -128 -128 -128 -128 -128 ...
##  $ pitch_arm           : num  22.5 22.5 22.5 22.1 22.1 22 21.9 21.8 21.7 21.6 ...
##  $ yaw_arm             : num  -161 -161 -161 -161 -161 -161 -161 -161 -161 -161 ...
##  $ total_accel_arm     : int  34 34 34 34 34 34 34 34 34 34 ...
##  $ gyros_arm_x         : num  0 0.02 0.02 0.02 0 0.02 0 0.02 0.02 0.02 ...
##  $ gyros_arm_y         : num  0 -0.02 -0.02 -0.03 -0.03 -0.03 -0.03 -0.02 -0.03 -0.03 ...
##  $ gyros_arm_z         : num  -0.02 -0.02 -0.02 0.02 0 0 0 0 -0.02 -0.02 ...
##  $ accel_arm_x         : int  -288 -290 -289 -289 -289 -289 -289 -289 -288 -288 ...
##  $ accel_arm_y         : int  109 110 110 111 111 111 111 111 109 110 ...
##  $ accel_arm_z         : int  -123 -125 -126 -123 -123 -122 -125 -124 -122 -124 ...
##  $ magnet_arm_x        : int  -368 -369 -368 -372 -374 -369 -373 -372 -369 -376 ...
##  $ magnet_arm_y        : int  337 337 344 344 337 342 336 338 341 334 ...
##  $ magnet_arm_z        : int  516 513 513 512 506 513 509 510 518 516 ...
##  $ roll_dumbbell       : num  13.1 13.1 12.9 13.4 13.4 ...
##  $ pitch_dumbbell      : num  -70.5 -70.6 -70.3 -70.4 -70.4 ...
##  $ yaw_dumbbell        : num  -84.9 -84.7 -85.1 -84.9 -84.9 ...
##  $ total_accel_dumbbell: int  37 37 37 37 37 37 37 37 37 37 ...
##  $ gyros_dumbbell_x    : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ gyros_dumbbell_y    : num  -0.02 -0.02 -0.02 -0.02 -0.02 -0.02 -0.02 -0.02 -0.02 -0.02 ...
##  $ gyros_dumbbell_z    : num  0 0 0 -0.02 0 0 0 0 0 0 ...
##  $ accel_dumbbell_x    : int  -234 -233 -232 -232 -233 -234 -232 -234 -232 -235 ...
##  $ accel_dumbbell_y    : int  47 47 46 48 48 48 47 46 47 48 ...
##  $ accel_dumbbell_z    : int  -271 -269 -270 -269 -270 -269 -270 -272 -269 -270 ...
##  $ magnet_dumbbell_x   : int  -559 -555 -561 -552 -554 -558 -551 -555 -549 -558 ...
##  $ magnet_dumbbell_y   : int  293 296 298 303 292 294 295 300 292 291 ...
##  $ magnet_dumbbell_z   : num  -65 -64 -63 -60 -68 -66 -70 -74 -65 -69 ...
##  $ roll_forearm        : num  28.4 28.3 28.3 28.1 28 27.9 27.9 27.8 27.7 27.7 ...
##  $ pitch_forearm       : num  -63.9 -63.9 -63.9 -63.9 -63.9 -63.9 -63.9 -63.8 -63.8 -63.8 ...
##  $ yaw_forearm         : num  -153 -153 -152 -152 -152 -152 -152 -152 -152 -152 ...
##  $ total_accel_forearm : int  36 36 36 36 36 36 36 36 36 36 ...
##  $ gyros_forearm_x     : num  0.03 0.02 0.03 0.02 0.02 0.02 0.02 0.02 0.03 0.02 ...
##  $ gyros_forearm_y     : num  0 0 -0.02 -0.02 0 -0.02 0 -0.02 0 0 ...
##  $ gyros_forearm_z     : num  -0.02 -0.02 0 0 -0.02 -0.03 -0.02 0 -0.02 -0.02 ...
##  $ accel_forearm_x     : int  192 192 196 189 189 193 195 193 193 190 ...
##  $ accel_forearm_y     : int  203 203 204 206 206 203 205 205 204 205 ...
##  $ accel_forearm_z     : int  -215 -216 -213 -214 -214 -215 -215 -213 -214 -215 ...
##  $ magnet_forearm_x    : int  -17 -18 -18 -16 -17 -9 -18 -9 -16 -22 ...
##  $ magnet_forearm_y    : num  654 661 658 658 655 660 659 660 653 656 ...
##  $ magnet_forearm_z    : num  476 473 469 469 473 478 470 474 476 473 ...
##  $ classe              : Factor w/ 5 levels "A","B","C","D",..: 1 1 1 1 1 1 1 1 1 1 ...
```
We see that most variables are numerica and there are a few factor variables. The factor variables and corresponding levels are

```r
# get classes of each feature
feature_classes<-sapply(training0_keep2,class)
feature_classes[feature_classes=='factor']
```

```
##      user_name cvtd_timestamp     new_window         classe 
##       "factor"       "factor"       "factor"       "factor"
```

```r
str(training0_keep2[names(feature_classes[feature_classes=='factor'])])
```

```
## 'data.frame':	19622 obs. of  4 variables:
##  $ user_name     : Factor w/ 6 levels "adelmo","carlitos",..: 2 2 2 2 2 2 2 2 2 2 ...
##  $ cvtd_timestamp: Factor w/ 20 levels "02/12/2011 13:32",..: 9 9 9 9 9 9 9 9 9 9 ...
##  $ new_window    : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
##  $ classe        : Factor w/ 5 levels "A","B","C","D",..: 1 1 1 1 1 1 1 1 1 1 ...
```

```r
lapply(training0_keep2[names(feature_classes[feature_classes=='factor'])],function(x) table(x)/length(x))
```

```
## $user_name
## x
##    adelmo  carlitos   charles    eurico    jeremy     pedro 
## 0.1983488 0.1585975 0.1802059 0.1564570 0.1733768 0.1330140 
## 
## $cvtd_timestamp
## x
## 02/12/2011 13:32 02/12/2011 13:33 02/12/2011 13:34 02/12/2011 13:35 
##      0.009020487      0.067322393      0.070074406      0.051931505 
## 02/12/2011 14:56 02/12/2011 14:57 02/12/2011 14:58 02/12/2011 14:59 
##      0.011976353      0.070329222      0.069513811      0.028386505 
## 05/12/2011 11:23 05/12/2011 11:24 05/12/2011 11:25 05/12/2011 14:22 
##      0.009683009      0.076291917      0.072622567      0.013607176 
## 05/12/2011 14:23 05/12/2011 14:24 28/11/2011 14:13 28/11/2011 14:14 
##      0.069819590      0.049587198      0.042452349      0.076342880 
## 28/11/2011 14:15 30/11/2011 17:10 30/11/2011 17:11 30/11/2011 17:12 
##      0.037661808      0.044287025      0.073387015      0.055702783 
## 
## $new_window
## x
##         no        yes 
## 0.97930894 0.02069106 
## 
## $classe
## x
##         A         B         C         D         E 
## 0.2843747 0.1935073 0.1743961 0.1638977 0.1838243
```
We already decided that user_name will be a relevant feature and we know that 'classe' is the truth. So now we need to understand the 'cvtd_timestamp' and the 'new_window' variables.  From the table counts above we see that 'new_window' is almost always 'no' so we do not expect this to have any useful information. Regarding the time stamp, we would need to understand better what it means.  Going back to the paper associated with this data, first let us download it for future reference

```r
url_paper <- 'http://web.archive.org/web/20170809020213/http://groupware.les.inf.puc-rio.br/public/papers/2013.Velloso.QAR-WLE.pdf'
paper_filename<-'paper.pdf'
rel_path_paper<-make_data_file_download(data_dirname,raw_data_subdirname,url_paper,paper_filename)
```

```
## Warning in make_data_directory(directory_name): The data directory and
## directory.log already exist.

## Warning in make_data_directory(directory_name): The data directory and
## directory.log already exist.
```

```
## Warning in make_data_sub_directory(directory_name, sub_directory_name): The
## data/raw directory already exists.
```

```
## Warning in make_data_file_download(data_dirname, raw_data_subdirname,
## url_paper, : The data/raw/paper.pdf file already exists.
```
I could not find a description of the time variables, however I think that this time stamp is irrelevant because we can see in the data other time variables in universal unix time.

```r
# First we convert a raw timstamp to date
as.POSIXct(training0_keep2[,'raw_timestamp_part_1'],origin='1970-01-01')[[1]]
```

```
## [1] "2011-12-05 11:23:51 WET"
```

```r
# Now we observe the timestamp to see how it relates to it
as.vector(training0_keep2[1,'cvtd_timestamp'])
```

```
## [1] "05/12/2011 11:23"
```

```r
# We see that up to rounding the second they are the same.
# Now we convert it to a POSIXct object for an easy comparison and check how many cases are different by more that 60s
sum(abs(as.vector(sapply(as.vector(training0_keep2['cvtd_timestamp']), function(x) as.POSIXct(x,format="%d/%m/%Y %H:%M")))-training0_keep2[,'raw_timestamp_part_1'])>60)
```

```
## [1] 0
```
So now we are confident that we can remove the 'cvtd_timestamp' as well.  As for the other timestamp, we see that it is much shorter, so we suspect it is some kind of duration for the exercise. We now convert the miliseconds to minutes to check that:

```r
head(training0_keep2[,'raw_timestamp_part_2']/(1000*60))
```

```
## [1] 13.138167 13.471633 13.672767  2.005650  3.272133  5.071283
```
It is not quite clear if the time variables are useful at all or even what they mean. So I will remove them all. 

Finally there is 'num_window' which sounds like something to do with the app that was used (and should be irrelevant from the point of view of prediction)

```r
table(training0_keep2['num_window'])
```

```
## 
##   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18 
##  20  21   3  28  21  21  21  24  24  12   3  21  28  24  24  29  17  19 
##  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36 
##  21  28  23  20  32  22   1  28  15  34  35  27  30  20  17  22  30  29 
##  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51  52  53  54 
##  28  18  25  28  25  24  33  22  17  17  28  31  18  35  20  15  32  18 
##  55  56  57  58  59  60  61  62  63  64  65  66  67  68  69  70  71  72 
##  22  24  38  13  30  26  20  29  17  29  18  12  22  14  13  22  24  24 
##  73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90 
##  31  20  25  20  25  14  34  22  10  34  24  13  24  25  16  21  15  19 
##  91  92  93  94  95  96  97  98  99 100 101 102 103 104 105 106 107 108 
##  22  30  26  20  26  18  34  21  15  28  15  25  15  26  20   7  16  18 
## 109 110 111 112 113 114 115 116 117 118 119 120 121 122 124 125 126 127 
##  24  27  25  23  38  11  24  27  33  17  31  25  18  25  21  17  24  21 
## 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 
##  25  21  16  18  23  27  23  24  20  21  29  15  25  20  22  16   3  26 
## 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 
##  19  23  18  24  20  24  32  27  22  26  21  20  22  35  21  24  25  27 
## 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 
##  26  24  21  20  27  24  25  20  26  21   1  34  22  23  23  21  16  20 
## 182 183 184 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 
##  20  29  24  22  22  18  24  23  22  20  24  32  10  19  20  21  29  22 
## 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 
##  23  24  18  22  23  21  28  23  23  20  19  12  23  28  26  34  21  27 
## 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 
##  12  23  24  17  28  28  25  26  31  26  21  29  21  29  27  29  30  18 
## 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 
##  32  22  22  22  10  16  28  24  28  27  33  24  29  26  25  24  24  19 
## 255 256 257 258 259 260 261 262 263 264 265 266 267 268 269 270 271 272 
##  24  22  29  24  23   2  19  28  20  30  22  32  26  13  29  17  22  18 
## 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287 288 289 290 
##  29  24  29  28  26   2  21  29  30  25  23  28  30  26  23  22  29  23 
## 291 292 293 294 295 296 297 298 299 300 301 302 303 304 305 306 307 308 
##  30  28  29  27  11   9  11  20  28  20  20  25  27  23  22  25  21  11 
## 309 310 311 312 313 314 315 316 317 318 319 320 321 322 323 324 325 326 
##  24  27  32  29  38  22  19  27  29  27  22  25  22  25  21  27  28  23 
## 327 328 329 330 331 332 333 334 335 336 337 338 339 340 341 342 343 344 
##  26  28  26  30  27  23  28  22  26  20  27  27  15  25  25  32  28  25 
## 345 346 347 348 349 350 351 352 353 354 355 356 357 358 359 360 361 362 
##  29  25  22  22  27  21  22  23  24  30  24  18  26  27  23  15  24  19 
## 363 364 365 366 367 368 369 370 371 372 373 374 375 376 377 378 379 380 
##  28  31  18  30  34  27  27  27  26  28  19  23  23  29  14  31  24  18 
## 381 382 383 384 385 386 387 388 389 390 391 392 393 394 395 396 397 398 
##  33  26  27   5  11  26  25  31  25  21  23  24  19  26  24  31  28  16 
## 399 400 401 402 403 404 405 406 407 408 409 410 411 412 413 414 415 416 
##  24  32  24  31  21  22  24  24  18  28  24  21  26  29  25  22  24  32 
## 417 418 419 420 421 422 423 424 425 426 427 428 429 430 431 432 433 434 
##  27  27  21  22  24  25  20  25  27  25  23  26  34  18  25  23  24  29 
## 435 436 437 438 439 440 441 442 443 444 445 446 447 448 449 450 451 452 
##  17  12  12  27  17  20  25  22  27  25  19  22  18  21  25  27  22  28 
## 453 454 455 456 457 458 459 460 461 462 463 464 465 466 467 468 469 470 
##   3  17  32  27  20  29  27  25  26  25  25  18  24  25  20  28  23  29 
## 471 472 473 474 475 476 477 478 479 480 481 482 483 484 485 486 487 488 
##  20  27  15  26  18  34  22   9  17  17  19  24  21  27  28  26  20  29 
## 489 490 491 492 493 494 495 496 497 498 499 500 501 502 503 504 505 506 
##  24  24  31  19  29  17  36  17   4  10  28  20  20  32  26  25  20  21 
## 507 508 509 510 511 512 513 514 515 516 517 518 519 520 521 522 523 524 
##  27  26  28  23  19  19  15  29  15  19  18  21  23  22  16  25  27  20 
## 525 526 527 528 529 530 531 532 533 534 535 536 537 538 539 540 541 542 
##  24  24  26  22  15  32  24  23  18  34  29  18  24   8   9  22  22  27 
## 543 544 545 546 547 548 549 550 551 552 553 554 555 556 557 558 559 560 
##  23  20  23  21  27  24  23  24  26  24  22  26  21  27  20  29  20  24 
## 561 562 563 564 565 566 567 568 569 570 571 572 573 574 575 576 577 578 
##  22  17  26  19  25  20  21  22  22  20  23  29  19  25  17  26  18  21 
## 579 580 581 583 584 585 586 587 588 589 590 591 592 593 594 595 596 597 
##  18  24  16  27  27  24  24  22  21  22  19  31  23  28  17  21  21  20 
## 598 599 600 601 602 603 604 605 606 607 608 609 610 611 612 613 614 615 
##  23  24  28  22  18  27  20  26  20  23  28  18  17  24  18   7  20  17 
## 616 617 618 619 620 621 622 623 624 625 626 627 628 629 630 631 632 633 
##  29  23  22  19  25  24  10  25  29  17  30  22  29  17  25  15   3  24 
## 634 635 636 637 638 639 640 641 642 643 644 645 646 647 648 650 651 652 
##  27  18  32  17  24  19  29  15  23  20  21  21  19  27  12  28  22  13 
## 653 654 655 656 657 658 659 660 661 662 663 664 665 666 667 668 669 670 
##  17  17  20  18  23  18  16  32  26  21  23  24  24  24  29  24  20  23 
## 672 673 674 675 676 677 678 679 680 681 682 683 684 685 686 687 688 689 
##  26  19  21  23  23  15  18  21  18  20  24  23  31  25  26  22  24  22 
## 690 691 692 693 694 695 696 697 698 699 700 701 702 703 704 705 706 707 
##  28  21  24  26  24  25  16  25  24  25  21  27  23  26  24  22  24  27 
## 708 709 710 711 712 713 714 715 716 717 718 719 720 721 722 723 724 725 
##  19  24  21  19  25  21   8  18  25  20  30  19  29  21  27  24  29  22 
## 726 727 728 729 730 731 732 733 734 735 736 737 738 739 740 741 742 743 
##  17  27  26  16  23  27  15   9  18  27  21  22  24  33  30  24  15  22 
## 744 745 746 747 748 749 750 751 752 753 754 755 756 757 758 759 760 761 
##  32  11   5  21  25  20  29  21  18  32  15  28  19  22  22  14  19  24 
## 762 763 764 765 766 767 768 769 771 772 773 774 775 776 777 778 779 780 
##  18  23  26  21  25  19  23  20  21  30  23  21  17  18  25  26  26  29 
## 781 782 783 784 785 786 787 788 789 790 791 792 793 794 795 796 797 798 
##  25  21  19  28  21  20  20  20  29  28  22  30  24  28  22  24  26  19 
## 799 800 801 802 803 804 805 806 807 808 809 810 811 812 813 814 815 816 
##  26  32  25  26  18  26  29  26  28  21  27  20  21  14  25  22  27  25 
## 817 818 819 820 821 822 823 824 825 826 827 828 829 830 831 832 833 834 
##  26  24  24  24  30  23  22  26  24  26  23  14  24  21  31  23  22  20 
## 835 836 837 838 839 840 841 842 843 844 845 846 847 848 849 850 851 852 
##  29  18  17  26  16  20  19  29   2  24  27  21  29  30  24  30  22   2 
## 853 854 855 856 857 858 859 860 861 862 863 864 
##  18  25  22  23  24  23  27  26  25  31  12  14
```
I will remove this variable as well because I can't see that it has anything to do with the sensors or with the way the exercise was carried out.

So our final data cleaned samples are obtained as follows

```r
var_keep3<-character(0)
for(name in var_keep2){
  if(!(name %in% c('raw_timestamp_part_1','raw_timestamp_part_2','cvtd_timestamp','new_window','num_window'))){
    var_keep3<-c(var_keep3,name)
  }
}
var_keep3
```

```
##  [1] "user_name"            "roll_belt"            "pitch_belt"          
##  [4] "yaw_belt"             "total_accel_belt"     "gyros_belt_x"        
##  [7] "gyros_belt_y"         "gyros_belt_z"         "accel_belt_x"        
## [10] "accel_belt_y"         "accel_belt_z"         "magnet_belt_x"       
## [13] "magnet_belt_y"        "magnet_belt_z"        "roll_arm"            
## [16] "pitch_arm"            "yaw_arm"              "total_accel_arm"     
## [19] "gyros_arm_x"          "gyros_arm_y"          "gyros_arm_z"         
## [22] "accel_arm_x"          "accel_arm_y"          "accel_arm_z"         
## [25] "magnet_arm_x"         "magnet_arm_y"         "magnet_arm_z"        
## [28] "roll_dumbbell"        "pitch_dumbbell"       "yaw_dumbbell"        
## [31] "total_accel_dumbbell" "gyros_dumbbell_x"     "gyros_dumbbell_y"    
## [34] "gyros_dumbbell_z"     "accel_dumbbell_x"     "accel_dumbbell_y"    
## [37] "accel_dumbbell_z"     "magnet_dumbbell_x"    "magnet_dumbbell_y"   
## [40] "magnet_dumbbell_z"    "roll_forearm"         "pitch_forearm"       
## [43] "yaw_forearm"          "total_accel_forearm"  "gyros_forearm_x"     
## [46] "gyros_forearm_y"      "gyros_forearm_z"      "accel_forearm_x"     
## [49] "accel_forearm_y"      "accel_forearm_z"      "magnet_forearm_x"    
## [52] "magnet_forearm_y"     "magnet_forearm_z"     "classe"
```

The final training data is

```r
training0_keep3<-training0_keep2[var_keep3]
```
and the final test data is

```r
var_keep3_testing<-c(var_keep3[1:(length(var_keep3)-1)],'problem_id')
testing_final_keep3<-testing_final[var_keep3_testing]
```
So now we will export this data in order to start carrying out the exploratory analysis in a different script

```r
clean_data_subdirname<-'clean'
make_data_sub_directory(data_dirname, clean_data_subdirname)
```

```
## Warning in make_data_directory(directory_name): The data directory and
## directory.log already exist.
```

```
## Warning in make_data_sub_directory(data_dirname, clean_data_subdirname):
## The data/clean directory already exists.
```

```
## [1] "data/clean"
```

```r
training_outfile<-paste(data_dirname,'/',clean_data_subdirname,'/','training_clean.csv',sep='')
write.csv(training0_keep3,training_outfile)
testing_outfile<-paste(data_dirname,'/',clean_data_subdirname,'/','testing_clean.csv',sep='')
write.csv(testing_final_keep3,testing_outfile)
```






