class BaseUploader < CarrierWave::Uploader::Base
  storage :upyun
  self.upyun_bucket = "cooper-upyun"
  self.upyun_bucket_host = "http://cooper-upyun.test.upcdn.net"
end
