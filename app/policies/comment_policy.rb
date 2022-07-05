# frozen_string_literal: true

# Documentation for the Class
class CommentPolicy < ApplicationPolicy
  def create?
    admin? || regular_user?
  end

  def destroy?
    admin? || moderator?
  end
end
