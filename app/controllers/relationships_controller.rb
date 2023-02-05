class RelationshipsController < ApplicationController
   before_action :set_user, only: [:create, :destroy, :followings, :followers, ]
   
  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    redirect_back(fallback_location: root_path)
  end
  
  def following
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  def follower
    @user = User.find(params[:user_id])
    @users = @user.followers
  end
  
  private
    def set_user
      @user = User.find(params[:user_id])
    end
  
end
