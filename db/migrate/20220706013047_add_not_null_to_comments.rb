# frozen_string_literal: true

class AddNotNullToComments < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :comments, bulk: true do |t|
        dir.up do
          t.string :content, null: false
          t.integer :reply_id, null: false
        end
      end
    end
  end
end
