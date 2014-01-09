# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "attachments"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "#{Time.new.to_i}-raw#{File.extname(super)}"
  end
end
