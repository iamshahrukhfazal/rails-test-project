# frozen_string_literal: true

# Documentation for the Class
class ReportPolicy < ApplicationPolicy
  def index?
    is_admin? || is_moderator?
  end

  def show?
    is_admin? || is_moderator?
  end

  def create?
    is_admin? || is_regular_user?
  end

  def all_reported_comment?
    is_admin? || is_moderator?
  end

  def all_reported_post?
    is_admin? || is_moderator?
  end
end
