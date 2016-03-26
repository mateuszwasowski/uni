class HomeController < ApplicationController
   before_action :authenticate_user!, except: [:index]

  def home
    if current_user
      @uni = current_user.universities
    else
      redirect_to root_path
    end
  end

  def index
    if current_user
      redirect_to home_path
    else
      

    end
  end
end
