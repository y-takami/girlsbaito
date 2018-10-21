# encoding: utf-8

class Image3Uploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "assets/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  # 画像の上限を700pxにする

  process :resize_and_pad => [900, 600, "#f5f5f5", Magick::CenterGravity]

  # 保存形式をJPGにする
  process :convert => 'jpg'

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

end
