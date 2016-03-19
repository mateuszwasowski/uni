ActiveAdmin.register Fileshare do
  permit_params :user_id,:file, :catalog_id, :description
end
