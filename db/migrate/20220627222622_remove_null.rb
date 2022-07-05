# frozen_string_literal: true

# Service to download ftp files from the server
class RemoveNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :comments, :content, true
  end
end
