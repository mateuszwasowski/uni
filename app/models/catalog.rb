class Catalog < ActiveRecord::Base
  belongs_to :university
  belongs_to :catolog
  belongs_to :user
  has_many :catalogs
  has_many :fileshares

  validates_presence_of :name
end
