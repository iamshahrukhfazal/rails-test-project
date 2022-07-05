# frozen_string_literal: true

# Service to download ftp files from the server
class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :links
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
