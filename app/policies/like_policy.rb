# frozen_string_literal: true

# Documentation for the Class
class LikePolicy < ApplicationPolicy
  def create?
    admin? ||    regular_user?
  end

  def destroy?
    admin? ||    regular_user?
  end
end
