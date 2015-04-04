class FriendshipsController < ApplicationController
  before_action :authenticate_user!


  def index
    @friends = Friendship.all
    @users = User.all
  end

  def create
    @friend = Friendship.create
    @friend.save!
  end

  def unfriend
    @unfriend = Friendship.destroy
    @unfriend.save
  end

  def show
    @friend = Friendship.find(params[:id])
    @user = User.find(params[:id])
    @friends = Friendship.all
  end
end
