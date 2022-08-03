# frozen_string_literal: true

class PagesController < ApplicationController
  # before_action :authenticate_user!

  def home
    @comments = Comment.latest
    @posts = Post.latest
    @likes = Like.latest
  end
end
