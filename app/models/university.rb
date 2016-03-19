class University < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  validates_presence_of :name
  has_and_belongs_to_many :users
  has_many :catalogs
end
