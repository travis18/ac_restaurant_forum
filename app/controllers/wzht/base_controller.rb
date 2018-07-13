class Wzht::BaseController < ApplicationController
  before_action :authenticate_admin
  
  private

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "You are not admin. Not allow!"
      redirect_to root_path
    end
  end
end