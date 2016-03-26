class CatalogController < ApplicationController
  # before_action :authenticate_user!

   def university_show
     @uni = University.find(params[:id])
   end

   def speciality
     @uni = University.find(params[:id])
     @special = Catalog.find(params[:s_id])
   end

   def show_folder
     @uni = University.find(params[:id])
     @special = Catalog.find(params[:s_id])
     @year = Catalog.find(params[:f_id])
     @fileshare = Fileshare.new()
   end

   def create_file
     @file = Fileshare.new(file_params)
     if @file.save
       flash[:notice] = "File uploaded."
       redirect_to :back
     else
       flash[:notice] = "File failed to upload."
       redirect_to :back
     end
   end


   private

   def file_params
      params.require(:fileshare).permit(:user_id,:catalog_id,:file)
    end

end
