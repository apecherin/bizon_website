# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :rails_admin_crop
    process :resize_to_fill => [180,180]
  end

  version :small_thumb, :from_version => :thumb do
    process resize_to_fill: [160, 160]
  end

  def extension_white_list
     %w(jpg jpeg gif png)
  end

end
