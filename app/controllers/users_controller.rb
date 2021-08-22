class UsersController < ApplicationController
   before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    # ログインユーザーのみの投稿表示
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(6)
  end

  def index
    @users = User.where(is_deleted: false)
  end

  def edit
    @user = User.find(params[:id])
    # ログインユーザーではない場合は編集できず自分のuser詳細画面に戻る
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
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

  # 退会画面
  def unsubscribe
    @user = User.find_by(params[:id])
  end

  # 退会処理
  def withdraw
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :artist, :is_deleted)
  end
end
