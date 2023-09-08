class BadgesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @badges = @user.badges
  end

  def all_badges
    @badges = Badge.all
  end 
end
