# frozen_string_literal: true

# Service to download ftp files from the server
class Change < ActiveRecord::Migration[5.2]
  def up
    change_column :posts, :status, :string
  end

  def down
    change_column :posts, :status, :string
  end
end
