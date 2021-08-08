class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  # フォロー一覧
  def followings
     user = User.find(params[:id])
     @users = user.followings
  end
  
  # フォロワー一覧
  def followers
     user = User.find(params[:id])
     @users = user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :artist)
  end

end
