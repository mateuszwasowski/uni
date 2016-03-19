class CatalogController < ApplicationController
   before_action :authenticate_user!

   def university_show
     @uni = University.find(params[:id])
   end

   def speciality
     @special = Catalog.find(params[:id])
   end

   def show_folder
     @year = Catalog.find(params[:id])
   end
end
