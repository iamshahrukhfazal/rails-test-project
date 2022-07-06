# frozen_string_literal: true

# Documentation for the Class
class SuggestionPolicy < ApplicationPolicy
  def index?
    admin? || regular_user? || moderator?
  end

  def show?
    admin? || regular_user?
  end

  def create?
    admin? || regular_user?
  end

  def update?
    admin? || regular_user?
  end
end
