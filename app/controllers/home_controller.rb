class HomeController < ApplicationController
   before_action :authenticate_user!, only: [:login]

  def home
    @uni = University.all

  end
end
