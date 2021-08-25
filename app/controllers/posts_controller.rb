class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    # フォローしているユーザーと自分の投稿を表示
    @posts = Post.where(user_id: [current_user.id, *current_user.following_ids]).order("created_at DESC").page(params[:page]).per(6)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user 
      render :edit
    else
        redirect_to posts_path
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post_path(post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @posts = @tag.posts.order("created_at DESC").page(params[:page]).per(8)
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :artist, :event, :body)
  end
end
