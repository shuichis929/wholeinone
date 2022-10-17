class UsersController < ApplicationController
  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :name, :avatar, :introduction, :email, :password)
  end
end
