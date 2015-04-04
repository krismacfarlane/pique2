class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = Friendship.all
  end

  def create
    @friend = Friendship.create
    @friend.save!
  end

  def unfriend
    @unfriend = Friendship.destroy
    @unfriend.save
  end
end
