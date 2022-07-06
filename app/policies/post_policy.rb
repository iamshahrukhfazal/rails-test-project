# frozen_string_literal: true

# Documentation for the Class
class PostPolicy < ApplicationPolicy
  def index?
    admin? || regular_user? || moderator?
  end

  def show?
    admin? || regular_user? || moderator?
  end

  def new?
    admin? || regular_user?
  end

  def create?
    admin? || regular_user?
  end

  def destroy?
    admin? || moderator?
  end

  def update?
    admin? || moderator? || regular_user?
  end
end
