# frozen_string_literal: true

# Documentation for the Class
class Report < ApplicationRecord
  # foreign Keys
  belongs_to :user
  belongs_to :reportable, polymorphic: true

  validates :report_status, presence: true

  scope :reported_comments, -> { where(reportable_type: CONSTANTS[:COMMENT]) }
  scope :reported_posts, -> { where(reportable_type: CONSTANTS[:POST]) }
  scope :un_reported_status, -> { where.not(report_status: nil) }
  scope :user_reported_posts, ->(id) { reported_posts.where(reportable_id: id) }
  scope :user_reported_comments, ->(id) { reported_comments.where(reportable_id: id) }
  scope :remove_post_duplicate, -> { select('DISTINCT ON (reportable_id) *').reported_posts.un_reported_status }
  scope :remove_comment_duplicate, -> { select('DISTINCT ON (reportable_id) *').reported_comments.un_reported_status }

  enum report_status: { abusive: 0, under18: 1 }
end
