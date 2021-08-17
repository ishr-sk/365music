class SearchesController < ApplicationController
  # viewから飛ばした3つのparamsを各インスタンス変数かローカル変数の中に入れる
  def search
    @category = params[:category]
    search = params[:search]
    word = params[:word]

    if @category == "3"
      @setlist = Setlist.search(search, word).order("created_at DESC").page(params[:page]).per(10)
    elsif @category == "2"
      @post = Post.search(search, word).order("created_at DESC").page(params[:page]).per(9)
    else 
      @user = User.search(search, word).page(params[:page]).per(10)
    end
  end
end
