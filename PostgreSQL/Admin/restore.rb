require 'aws-sdk'

if ARGV.count == 1
  puts ARGV[0]
  PumgranaBucketName = "pumgrana.backup"
  Aws.config.update({
                      region: 'us-west-2',
                      credentials: Aws::InstanceProfileCredentials.new()
                  })
  s3 = Aws::S3::Client.new
  date_pumgrana_backup = ARGV[0]
  LocalFileName = "Pumgrana-#{date_pumgrana_backup}.gz"
  s3.get_object(response_target: LocalFileName,
                bucket: PumgranaBucketName,
                key: LocalFileName)
  CmdRestore = "cat #{LocalFileName} | gunzip | psql -U api pumgrana"
  system(CmdRestore)
  File.delete(LocalFileName)
end
