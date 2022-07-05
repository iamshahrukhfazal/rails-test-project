# frozen_string_literal: true

# Doc for class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  CONSTANTS = {
    PUBLISHED: 'published',
    UNPUBLISHED: 'unpublished',
    COMMENT: 'Comment',
    POST: 'Post',
    USER: 'user'
  }.freeze
end
