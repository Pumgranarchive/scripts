require 'date'
require 'aws-sdk'

# Dump de la base de donnees
DateNow = DateTime.now.strftime("%Y-%m-%d")
BackupFilename = "Pumgrana-#{DateNow}.gz"
CmdBackup = "pg_dump -U api  pumgrana | gzip > #{BackupFilename}"
system(CmdBackup)

# Envoie du backup sur s3
PumgranaBucketName = "pumgrana.backup"
Aws.config.update({
                    region: 'us-west-2',
                    credentials: Aws::InstanceProfileCredentials.new()
                  })
s3 = Aws::S3::Client.new

CreateBucket = true
buckets = s3.list_buckets
buckets.buckets.each{ |bucket|
  if (bucket.name == PumgranaBucketName)
    CreateBucket = false 
  end
}

s3.create_bucket(bucket: PumgranaBucketName, create_bucket_configuration: {location_constraint: "us-west-2" }) if CreateBucket == true

File.open(BackupFilename, 'rb') do |file|
  s3.put_object(bucket: PumgranaBucketName, key: BackupFilename, body: file)
end
File.delete(BackupFilename)
