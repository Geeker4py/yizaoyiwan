# The defined image name versions to limit use
# IMAGE_UPLOADER_ALLOW_IMAGE_VERSION_NAMES = %(320 640 800)
class ImageUploader < CarrierWave::Uploader::Base
  def store_dir
    month = DateTime.now.strftime('%Y/%m')
    "#{model.class.to_s.underscore}/#{month}/"
  end

  def default_url
    # You can use FTP to upload a default image
    "#{Setting.upload_url}/blank.png#{version_name}"
  end

  # Override url method to implement with "Image Space"
  # def url(version_name = "")
  #   @url ||= super({})
  #   version_name = version_name.to_s
  #   return @url if version_name.blank?
  #   if not version_name.in?(IMAGE_UPLOADER_ALLOW_IMAGE_VERSION_NAMES)
  #     # To protected version name using, when it not defined, this will be give an error message in development environment
  #     raise "ImageUploader version_name:#{version_name} not allow."
  #   end
  #   [@url,version_name].join("!") # thumb split with "!"
  # end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "#{model.id}.#{file.extension.downcase}" if original_filename.present?
  end
end