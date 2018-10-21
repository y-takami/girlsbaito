# encoding: utf-8

class MainImageUploader < CarrierWave::Uploader::Base


  include CarrierWave::RMagick

  storage :file
  # storage :fog

  def store_dir
    "assets/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 画像の上限を700pxにする

  process :resize_and_pad => [900, 600, "#f5f5f5", Magick::CenterGravity]

  # 保存形式をJPGにする
  process :convert => 'jpg'




  # サムネイルを生成する設定
  version :thumb do
    process :resize_to_limit => [300, 300]
    process :convert => 'jpg'
  end

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

end
