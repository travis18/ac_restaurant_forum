class UsersController < ApplicationController

  def show
    @user = current_user
  end

  private

  def profile_params
    params.require(:user).permit(:name, :intro, :avartar)
  end
end
