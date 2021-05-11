class HomesController < ApplicationController
  def top
  end

  def about
  end

  def mypage
    @user = User.find_by(name: params[:id])
  end

  def unsubscribe
    @user = User.find_by(name: params[:name])
    @unsubscribe_user = current_user
  end

  def withdraw
    @user = User.find_by(name: params[:name])
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

end
