# frozen_string_literal: true

# Doc for class
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent, class_name: Constants[:COMMENT], optional: true

  has_many :comments, foreign_key: 'parent_id', dependent: :destroy, inverse_of: :parent
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy

  validates :content, presence: true

  has_rich_text :content

  scope :latest_comments, -> { order(updated_at: :desc).last(10) }
end
