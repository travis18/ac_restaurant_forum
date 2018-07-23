class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(profile_params)
      flash.notice = "Your profile has been updated successfully"
      redirect_to user_path
    else
      flash.alert = "There is something wrong in your profile"
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :intro, :avatar)
  end
end
