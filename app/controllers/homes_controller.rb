class HomesController < ApplicationController
  def top
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = '123456'
    end
    sign_in user
    redirect_to user_path(current_user)
  end

end
