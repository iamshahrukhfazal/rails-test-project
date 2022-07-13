# frozen_string_literal: true

# testing the game
class UsersController < ApplicationController
  before_action :authenticate_user!

  def user_profile
    @likes =  Like.where(user_id: current_user.id).count
    @comments = current_user.comments.count
    @posts = current_user.posts.count
  end
end
