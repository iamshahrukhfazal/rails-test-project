# frozen_string_literal: true

#testing the game
class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def user_profile
        @likes = current_user.like_content.count
        @comments = current_user.like_content.count
        @posts = current_user.like_content.count
    end
  
end
  
  