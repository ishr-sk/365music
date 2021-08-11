class SearchesController < ApplicationController
  # viewから飛ばした3つのparamsを各インスタンス変数かローカル変数の中に入れる
  def search
    @category = params[:category]
    search = params[:search]
    word = params[:word]

    if @category == "3"
      @setlist = Setlist.search(search, word)
    elsif @category == "2"
      @post = Post.search(search, word)
    else 
      @user = User.search(search, word)
    end
  end
end
