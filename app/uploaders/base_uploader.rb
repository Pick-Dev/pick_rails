class BaseUploader < CarrierWave::Uploader::Base
  storage :upyun
end
