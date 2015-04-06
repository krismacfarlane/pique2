class FriendshipsController < ApplicationController
  before_action :authenticate_user!


  def index
    @friends = Friendship.all
    @users = User.all
  end

  def new
    @friend = Friendship.new
  end

  def create
    @friend = Friendship.create(friend_params)
    @friend.save!
    redirect_to friends
  end

  def unfriend
    @unfriend = Friendship.destroy(params[:id])
    @unfriend.save
    redirect_to friend
  end

  def show
    @friend = Friendship.find(params[:id])
    @user = User.find(params[:id])
    @friends = Friendship.all
    # redirect_to friends_path
  end

  def edit
    @friend = Friendship.find(params[:id])
  end

  def update
    friend = Friendship.find(params[:id])
    friend.update(friend_params)
    redirect_to friend
  end


  def friend_params
    params.require(:friend).permit(:popular_model_id, :popular_model_type, :friend_id, :friend_type)
  end
end
