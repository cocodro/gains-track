class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fill => [300, 350]

  # Create different versions of your uploaded files:
  version :tiny do
    process :resize_to_fit => [18, 21]
  end
  version :small do
    process :resize_to_fit => [54, 63]
  end
  version :profile do
    process :resize_to_fit => [180, 210]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
