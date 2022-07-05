# frozen_string_literal: true

# Service to download ftp files from the server
class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.string :content
      t.integer :status
      t.references :user, foreign_key: true
      t.references :post

      t.timestamps
    end
    add_index :suggestions, [:id], unique: true
  end
end
