class Image
  extend CarrierWave::Mount

  attr_accessor :id, :image

  mount_uploader :image, ImageUploader

  def save
    self.id = SecureRandom.uuid.gsub('-', '')
    self.store_image!
  end
end