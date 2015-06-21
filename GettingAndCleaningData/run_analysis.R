### Extract the features related to mean and std of the measurements

# Load the feature names
features <- read.table( "features.txt" , sep=" " )

# Get the mean() and std() features
msf       <- grep( "mean[(][)]|std[(][)]" , features[[2]] )
msf_names <- grep( "mean[(][)]|std[(][)]" , features[[2]] , value=T )

# Load the training and test sets
train <- read.table( "train/X_train.txt" )
test  <- read.table( "test/X_test.txt" )

# Take the mean() and std() features and forget the rest
train <- train[,msf]
test  <- test[,msf]

# Clean out objects that are no longer needed
rm( 
  features ,
  msf
)


### Merge the training and test sets

# Load the subject IDs and activity labels and prepend them, respectively, to 
#   the training and test sets.
sbtrain <- read.table( "train/subject_train.txt" )
lbtrain <- read.table( "train/y_train.txt" )
sbtest  <- read.table( "test/subject_test.txt" )
lbtest  <- read.table( "test/y_test.txt" )

train <- data.frame( sbtrain , lbtrain , train )
test  <- data.frame( sbtest  , lbtest  , test  )

# Set improved header names
header <- c( "subject" , "activity" , msf_names )
names( train ) <- header
names( test )  <- header

# Merge the data sets
data <- merge( train , test , all=T )

# Clean out objects that are no longer needed
rm( 
  sbtrain ,
  lbtrain ,
  sbtest ,
  lbtest ,
  train ,
  test ,
  header ,
  msf_names
)


### Add appropriate activity name to each row

# Load the activity labels
lbact <- read.table( "activity_labels.txt" )

# Add the activity name to each row
data <- merge( lbact , data )

# Clean out objects that are no longer needed
rm( lbact )


### Write the data set to a file
write.table( data , file="tidy.txt" , row.name=FALSE )
