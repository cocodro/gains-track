class PictureUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :main do
    process :resize_to_fill => [300, 350]
  end
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :icon do
    process :resize_to_fit => [18, 21]
  end
  version :small do
    process :resize_to_fit => [54, 63]
  end
  version :profile do
    process :resize_to_fit => [180, 210]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
