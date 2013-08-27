class Image < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  attr_accessible :file
  mount_uploader :file, FileUploader
end
