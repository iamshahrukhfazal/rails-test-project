# frozen_string_literal: true

class LikesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_post, only: %i[destroy]
  skip_before_action :verify_authenticity_token

  def create
    # byebug
    @post = Like.new(like_params)
    respond_to do |format|
      if @post.save
        @like_class = (@post.likeable.class.to_s).eql?(CONSTANTS[:COMMENT])
        format.json {render json: get_post}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def destroy

    @like_class = (@post.likeable.class.to_s).eql?(CONSTANTS[:COMMENT])
    @post.destroy
    respond_to do |format|
      format.json {render json: get_post}
      format.js
    end
  end

  private
  def set_post
    @post = Like.find_by(user_id:like_params[:user_id],id:params[:id].to_i)

  end

  def get_post

    if(like_params[:likeable_type]==="Post")
      @current_post = Post.find_by(id: like_params[:likeable_id])
    else
      @current_post = Comment.find_by(id: like_params[:likeable_id]).post
    end

    @current_post.attributes.merge(
      {
        content:@current_post.content,
        likes:@current_post.likes.count,
        liked_by:@current_post.likes,
        comments:@current_post.comments.where(reply_id: nil).order(id: :desc).map{ |comment|
           comment.attributes.merge(
              { likes:comment.likes.count,
                liked_by:comment.likes,
                replies:comment.replies.map{|reply|
                   reply.attributes.merge({likes:reply.likes.count,liked_by:reply.likes,content:reply.content}) },
                   content:comment.content })}})
  end
  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type, :user_id)
  end
end
