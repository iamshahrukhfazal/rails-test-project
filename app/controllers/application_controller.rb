# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend
  # protect_from_forgery with: :exception, prepend: true
  # protect_from_forgery unless: -> { request.format.json? }
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    flash[:alert] = 'Record not found.'
    if params[:format]
      respond_to do |format|
        format.json { render json: { status: 404, message: 'Data not found' } }
      end
    else
      redirect_to request.referer || root_path

  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referer || root_path)
  end

  CONSTANTS = {
    PUBLISHED: 'published',
    UNPUBLISHED: 'unpublished',
    COMMENT: 'Comment',
    POST: 'Post',
    USER: 'user'
  }.freeze
end
