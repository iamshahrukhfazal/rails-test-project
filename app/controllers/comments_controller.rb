# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[destroy]
  skip_before_action :verify_authenticity_token

  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params['id'].to_i)
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        @post = @comment.post
        format.json { render json: @post.to_json(include: :likes, include: { comments: { include: :replies } }) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: { status: :unprocessable_entity, message: 'Fail to create record' } }
      end
      format.js
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :reply_id, :user_id).merge(post_id: params[:post_id])
  end
end
