ActiveAdmin.register User do
  permit_params :email,:password,:image,:name,:avatar

end
