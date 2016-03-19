class Fileshare < ActiveRecord::Base
  belongs_to :user
  belongs_to :catalog

  mount_uploader :file, DropFileUploader

  def name
    self.file.url.split('/').last
  end
end
