# frozen_string_literal: true

# Documentation for the Class
class UpdateStatusPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :status
    add_column :posts, :status, :integer, default: 1
  end
end
