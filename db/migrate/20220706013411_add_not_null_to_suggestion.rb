# frozen_string_literal: true

class AddNotNullToSuggestion < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :suggestions, bulk: true do |t|
        dir.up do
          t.string :content, null: false
          t.bigint :post_id, null: false
          t.string :message, null: false
        end
      end
    end
  end
end
