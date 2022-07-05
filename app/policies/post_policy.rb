# frozen_string_literal: true

# Documentation for the Class
class PostPolicy < ApplicationPolicy
  def index?
    is_admin? || is_regular_user? || is_moderator?
  end

  def show?
    is_admin? || is_regular_user? || is_moderator?
  end

  def new?
    is_admin? || is_regular_user?
  end

  def create?
    is_admin? || is_regular_user?
  end

  def destroy?
    is_admin? || is_moderator?
  end

  def update?
    is_admin? || is_moderator?
  end
end
