# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[destroy]
  before_action :set_likeable, only: %i[create]

  def create
    # constatize
    @like = @likeable.likes.new(like_params)
    @like.user_id = current_user.id

    respond_to do |format|
      if @like.save
        @post = Post.find(id: @like.likeable_id)
        # @like_class = (@post.likeable.class.to_s).eql?(CONSTANTS[:COMMENT])
      else
        format.html { render :new, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def destroy
    @like_class = @post.likeable.class.to_s.eql?(CONSTANTS[:COMMENT])
    @post.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def set_likeable
    # Post and Comment
    @likeable = like_params[:likeable_type].constantize.find(like_params[:likeable_id])
  end

  def set_post
    # @post = current_user.like_content.find(params[:id])
    @post = Like.find_by(id: params[:id], user_id: current_user.id)
  end

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
