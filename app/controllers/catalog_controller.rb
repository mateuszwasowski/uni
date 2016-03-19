class CatalogController < ApplicationController
   #before_action :authenticate_user!

   def university_show
     @uni = University.find(params[:id])
   end

   def speciality
     @special = Catalog.find(params[:id])
   end

   def show_folder
     @year = Catalog.find(params[:id])
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

   def download
     @model = Fileshare.find(params[:id])
     send_file(@model.file.path,
        :filename => @model.file,
        :type => @model.file.content_type,
        :disposition => 'attachment',
        :url_based_filename => true)
   end

   private

   def file_params
      params.require(:fileshare).permit(:user_id,:catalog_id,:file)
    end

end
