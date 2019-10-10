#!/bin/sh

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export BUCKET

export MYSQL_USER
export MYSQL_PASSWORD
export MYSQL_DATABASE
export MYSQL_HOST
DATE=$(date "+%Y-%m-%d-%H-%M-%S")

for t in $(mysql -NBA -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD -D $MYSQL_DATABASE -e 'show tables')
do 
    echo "DUMPING TABLE: $MYSQL_DATABASE.$t"
    mysqldump -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE $t | gzip > $DATE-$t.sql.gz
    tbl_count=$(( tbl_count + 1 ))
done

echo "$tbl_count tables dumped from database '$MYSQL_DATABASE'"

for i in *.gz; do
    S3_KEY=$BUCKET/backups/$DATE/$i
    aws s3 cp $i s3://$S3_KEY --sse AES256
    rm -f $i
done
echo "$tbl_count files uploaded to '$BUCKET' s3 bucket"
