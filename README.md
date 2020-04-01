# syncFolderMakePublicS3


Shell Script to sync a directory to s3 bucket.

For execute this script use /path/uploads3.sh profileName direcorySync bucketName

Pre-requisites is the uploads3.sh with 755 permision and aws cli installed.

Example:

If i execute /path/uploads3.sh evolvest ~/Desktop/pathsync myBucketName on terminal, on browser may write this http://s3.amazonaws.com/myBucketName/ for open