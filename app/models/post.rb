# frozen_string_literal: true

# Doc for the class
class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  has_many :suggestions, dependent: :destroy

  validates :content, :title, presence: true

  has_rich_text :content

  enum status: { published: 0, unpublished: 1 }

  scope :latest, -> { where(status: CONSTANTS[:PUBLISHED]).order(updated_at: :desc).last(10) }
  scope :search_by_field_substring, lambda { |query|
    where('title ILIKE ?', "%#{query}%")
  }
end
