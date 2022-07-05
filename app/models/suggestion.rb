# frozen_string_literal: true

class Suggestion < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true

  enum status: { pending: 0, cancel: 1, approved: 2 }

  scope :user_suggestions, ->(id) { where(user_id: id) }
end
