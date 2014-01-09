require 'carrierwave/orm/activerecord'

class Attachment < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  validates :attachment, presence: true
end
