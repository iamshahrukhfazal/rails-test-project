# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show update destroy]
  skip_before_action :verify_authenticity_token, only: %i[search]

  def index
    authorize Post
    if current_user.role.eql? :user
      @pagy, @posts = pagy(Post.where(status: CONSTANTS[:PUBLISHED]), items: 5)
    else
      @posts = Post.all
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
    authorize Post
  end

  def new
    @post = current_user.posts.new
    authorize Post
  end

  def create
    authorize Post
    @post = Post.new(post_params)
    @post.user = current_user
    @post.status = :unpublished

  
    respond_to do |format|
    
      if @post.save
        format.html { render :new, status: 200 }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def update
    authorize Post
    respond_to do |format|
      format.html { redirect_to post_url(@post), notice: t('errors.update_post') } if @post.update(post_params)
      format.js
    end
  end

  def destroy
    # authorize Post


    @post.destroy
    respond_to do |format|
      # format.html { render :new, status: :unprocessable_entity }
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

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:content, :title)
  end
end
