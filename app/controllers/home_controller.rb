class HomeController < ApplicationController
  # before_action :authenticate_user!, except: [:index]

  def home
    if current_user
      @uni = current_user.universities
    else
      @uni = University.all
    end
  end
end
