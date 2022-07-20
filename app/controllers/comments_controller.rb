# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[destroy]

  def new
    @comment = Comment.new
  end

  def create
  
    @comment = current_user.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        @post = @comment.post
      else
        format.html { render :new, status: :unprocessable_entity }
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
    
    params.require(:comment).permit(:content, :reply_id).merge(post_id: params[:post_id])
  end
end
