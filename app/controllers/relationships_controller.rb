class RelationshipsController < ApplicationController
  def create
    follow = current_user.relationships.build(followed_id: params[:user_id])
    follow.save
    redirect_to request.referer
  end

  def destroy
    follow = current_user.relationships.find_by(followed_id: params[:user_id])
    follow.destroy
    redirect_to request.referer
  end
end
