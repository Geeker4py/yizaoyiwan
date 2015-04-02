CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username    = Settings.upyun.username
  config.upyun_password    = Settings.upyun.password
  config.upyun_bucket      = Settings.upyun.bucket
  config.upyun_bucket_host = Settings.upyun.bucket_host
end