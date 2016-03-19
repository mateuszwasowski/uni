class University < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  validates_presence_of :name, :avatar
end
