# encoding: utf-8
# frozen_string_literal: true
class ImageUploader < BaseUploader
  IMAGE_UPLOADER_ALLOW_IMAGE_VERSION_NAMES = %(small,200x200,w700,smalllightbox,w1500).freeze

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    folder = Time.zone.today.strftime '%Y/%m'
    @name ||= "#{folder}/#{SecureRandom.uuid}.#{file.extension.downcase}" if original_filename.present?
  end

  def url(version_name = '')
    @url ||= super({})
    version_name = version_name.to_s
    return @url if version_name.blank?
    unless version_name.in?(IMAGE_UPLOADER_ALLOW_IMAGE_VERSION_NAMES)
      raise "ImageUploader version_name:#{version_name} not allow."
    end
    [@url, version_name].join('!')
  end

  def remove!
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
