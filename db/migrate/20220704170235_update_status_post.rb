# frozen_string_literal: true

# Documentation for the Class
class UpdateStatusPost < ActiveRecord::Migration[5.2]
  def up
    remove_column :posts, :status
    add_column :posts, :status, :integer, default: 1
  end

  def down
    remove_column :posts, :status
    add_column :posts, :status, :integer, default: 1
  end
end
