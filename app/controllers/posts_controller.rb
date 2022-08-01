# frozen_string_literal: true

class PostsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_post, only: %i[show update destroy]
  # before_action :get_post, only: %i[show]
  skip_before_action :verify_authenticity_token, only: %i[search]

  # GET /posts or /posts.json
  def index  
    @posts = Post.all
    respond_to do |format|
      format.html
      format.json {render json: @posts.map{ |post| post.attributes.merge({ comments:post.comments.count, likes:post.likes.count, data:post.content,email:post.user.email })}}
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
    # authorize Post
    respond_to do |format|
      format.html
      format.json {
        # merge Commente
        render json: @post.attributes.merge(
          {
            content:@post.content,
            likes:@post.likes.count,
            liked_by:@post.likes,
            comments:@post.comments.where(reply_id: nil).order(id: :desc).map{ |comment|
               comment.attributes.merge(
                  { likes:comment.likes.count,
                    liked_by:comment.likes,

                    replies:comment.replies.map{|reply|
                       reply.attributes.merge({likes:reply.likes.count,liked_by:reply.likes,content:reply.content}) },
                       content:comment.content })}})}
    end
  end

  # def edit; end

  def new
    authorize Post
    @post = current_user.posts.new
  end

  # POST /posts or /posts.json
  def create
    authorize Post
    @post = Post.new(post_params)
    @post.user = current_user
    # refactor
    @post.status = :unpublished

    respond_to do |format|
      if @post.save
        Rails.logger.debug 'save'
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

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:content, :links, :status, :title)
  end
end
