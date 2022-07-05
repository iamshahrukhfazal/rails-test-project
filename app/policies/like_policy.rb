# frozen_string_literal: true

# Documentation for the Class
class LikePolicy < ApplicationPolicy
  def create?
    is_admin? || is_regular_user?
  end

  def destroy?
    is_admin? || is_regular_user?
  end
end
