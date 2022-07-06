# frozen_string_literal: true

class AddNotNullToPost < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :comments, bulk: true do |t|
        dir.up do
          t.string :title, null: false
          t.bigint :user_id, null: false
          t.string :content, null: false
        end
      end
    end
  end
end
