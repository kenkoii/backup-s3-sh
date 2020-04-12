# backup-s3-sh

## Requirements

 1. Docker
 

## How to run locally

 1. Build the image first
`docker build -t <name:tag> .`
 2. Create an env file, refer to the `sample_env` file and your keys
 ```AWS_ACCESS_KEY_ID=xxxxxxxxxxxxxxxxxxxx
AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxx
BUCKET=xxxxxxxxxxxxxxxxxxxx
MYSQL_USER=xxxxxxxxxxxxxxxxxxxx
MYSQL_PASSWORD=xxxxxxxxxxxxxxxxxxxx
MYSQL_DATABASE=xxxxxxxxxxxxxxxxxxxx
MYSQL_HOST=xxxxxxxxxxxxxxxxxxxx
```
 4. Run the image
`docker run --env-file=<env_file_name_you_created> -it <name:tag>` 
