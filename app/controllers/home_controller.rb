class HomeController < ApplicationController
   before_action :authenticate_user!, :only [:login]
end
