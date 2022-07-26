# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    # flash[:alert] = 'Record not found.'
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
