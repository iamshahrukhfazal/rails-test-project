# frozen_string_literal: true

# Doc for the class
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  scope :latest_likes, -> { order(updated_at: :desc).last(10) }
end
