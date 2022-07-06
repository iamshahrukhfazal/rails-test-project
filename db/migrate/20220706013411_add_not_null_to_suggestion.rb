# frozen_string_literal: true

class AddNotNullToSuggestion < ActiveRecord::Migration[5.2]
  def change
    change_column :suggestions, :content, :string, null: false
    change_column :suggestions, :post_id, :bigint, null: false
    change_column :suggestions, :message, :string, null: false
  end
end
