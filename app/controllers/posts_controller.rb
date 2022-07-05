# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: %i[search]

  # GET /posts or /posts.json
  def index
    authorize Post

    if current_user.role.eql? 'user'
      @pagy, @posts = pagy(Post.where(status: Constants[:PUBLISHED]), items: 5)
    else
      @posts = Post.all
    end
    @post = Post.new
    @suggestion = Suggestion.new
  end

  # GET /posts/1 or /posts/1.json
  def show
    authorize Post
    @report = Report.new
    @suggestion = Suggestion.new
    @comment = Comment.new
    authorize Post
  end

  # GET /posts/new
  def new
    authorize Post
    @post = Post.new
    @post.user = current_user
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.status = 1

    respond_to do |format|
      if @post.save
      else
        format.html { render :new, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' } if @post.update(post_params)
      format.js
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
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

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:content, :links, :status, :title)
  end
end
