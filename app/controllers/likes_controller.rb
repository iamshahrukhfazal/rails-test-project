# frozen_string_literal: true

class LikesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_post, only: %i[destroy]
  skip_before_action :verify_authenticity_token

  def create
    # byebug
    @like = Like.new(like_params)
    respond_to do |format|
      if @like.save
        @like_class = (@like.likeable.class.to_s).eql?(CONSTANTS[:COMMENT])
        format.json { render json: get_post, status: :ok }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def destroy
    @like_class = (@post.likeable.class.to_s).eql?(CONSTANTS[:COMMENT])
    @post.destroy
    rb espond_to do |format|
      format.json { render json: get_post }
      format.js
    end
  rescue Exception => e
    respond_to do |format|
      format.json { render json: { status: 404, message: 'Record not found' } }
    end
  end

  private

  def set_post
    @post = Like.find_by(user_id: like_params[:user_id], id: params[:id].to_i)
  end

  def get_post
    @current_post = if like_params[:likeable_type] === 'Post'
                      Post.find_by(id: like_params[:likeable_id])
                    else
                      Comment.find_by(id: like_params[:likeable_id]).post
                    end

    @current_post.to_json(include: :likes, include: { comments: { include: :replies } })
  end

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type, :user_id)
  end
end
