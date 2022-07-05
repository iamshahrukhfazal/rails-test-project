# frozen_string_literal: true

# Documentation for the Class
class ReportPolicy < ApplicationPolicy
  def index?
    admin? ||    moderator?
  end

  def show?
    admin? ||    moderator?
  end

  def create?
    admin? ||    regular_user?
  end

  def all_reported_comment?
    admin? ||    moderator?
  end

  def all_reported_post?
    admin? ||    moderator?
  end
end
