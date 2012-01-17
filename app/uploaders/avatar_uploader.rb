class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    [model.class.to_s.underscore, mounted_as, version_name, "default.gif"].compact.join('_')
  end

  process :resize_to_fit => [512, 512]

  version :list do
    process :resize_to_fill => [48, 48]
  end

  version :profile do
    process :resize_to_fill => [128, 128]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
