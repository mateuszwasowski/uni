class CatalogController < ApplicationController
   before_action :authenticate_user!
end
