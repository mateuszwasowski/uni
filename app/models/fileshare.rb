class Fileshare < ActiveRecord::Base
  belongs_to :user
  belongs_to :catalog

  mount_uploader :file, DropFileUploader

  
end
