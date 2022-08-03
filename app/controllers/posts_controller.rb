# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show update destroy]
  before_action :get_post, only: %i[show]
  skip_before_action :verify_authenticity_token

  def index
    @posts = Post.includes(:likes, comments: :replies)
    respond_to do |format|
      format.html
      format.json { render json: @posts, each_serializer: PostSerializer }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @post.to_json(include: :likes, include: { comments: { include: :replies } }) }      
    end
  end

  def new
    authorize Post
    @post = current_user.posts.new
  end

  def create
    
    @post = Post.new(post_params)
    @post.status = :unpublished
    respond_to do |format|
      if @post.save
        format.json { render json: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: { status: 404, message: 'Fail to create record' } }
      end
      format.js
    end
  end

  def update
    
    respond_to do |format|
      if @post.update(post_params)
        format.json { render json: @post }
        format.html { redirect_to post_url(@post), notice: t('errors.update_post') }
      else
        format.json { render json: { status: 204, message: 'Fail to update record' } }
      end
      format.js
    end
  end

  def destroy
    authorize Post
    @post.destroy
    respond_to do |format|
      format.js
    end
  end

  def search
    @posts = if post_params[:title].length.positive?
               Post.search_by_field_substring(post_params[:title])
             else
               Post.all
             end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :links, :status, :title, :user_id)
  end
end
