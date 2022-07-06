# frozen_string_literal: true

# Doc for class
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :reply, class_name:  CONSTANTS[:COMMENT].to_s, optional: true

  has_many :replies, class_name: :Comment, foreign_key: :reply_id,  dependent: :destroy, inverse_of: :reply
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy

  validates :content, presence: true

  has_rich_text :content

  scope :latest, -> { order(updated_at: :desc).last(10) }
end
