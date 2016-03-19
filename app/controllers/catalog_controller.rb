class CatalogController < ApplicationController
   #before_action :authenticate_user!

   def university_show
     @uni = University.find(params[:id])
   end

   def speciality

   end

   def catalog_show

   end
end
