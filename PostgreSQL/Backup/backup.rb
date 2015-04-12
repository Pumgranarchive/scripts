require 'aws-sdk'
require 'date'

system("pg_dump -U api -d pumgrana > outfile");

s3 = Aws::S3::Client.new(region: 'us-west-2');

date_str = DateTime.now.to_date.to_s;
filename = "backup-db-" + date_str.to_s;

puts filename;

s3.put_object(acl: "private", body: File.read('outfile'), bucket: "pg-backupdb", key: filename);
