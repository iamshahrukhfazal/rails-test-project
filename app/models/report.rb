# frozen_string_literal: true

# Documentation for the Class
class Report < ApplicationRecord
  # foreign Keys
  belongs_to :user
  belongs_to :reportable, polymorphic: true

  validates :report_status, presence: true

  scope :reported_comment, -> { where(reportable_type: Constants[:COMMENT]) }
  scope :reported_post, -> { where(reportable_type: Constants[:POST]) }
  scope :un_reported_status, -> { where.not(report_status: nil) }
  scope :user_reported_post, ->(id) { where(reportable_id: id) }
  scope :remove_post_duplicate, -> { select('DISTINCT ON (reportable_id) *').reported_post.un_reported_status }
  scope :remove_comment_duplicate, -> { select('DISTINCT ON (reportable_id) *').reported_comment.un_reported_status }

  enum report_status: { abusive: 0, under18: 1 }
end
