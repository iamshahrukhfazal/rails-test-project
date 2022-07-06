# frozen_string_literal: true

class AddNotNullToReport < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :reports, bulk: true do |t|
        dir.up do
          t.string :reportable_type, null: false
          t.integer :reportable_id, null: false
          t.integer :user_id, null: false
        end
      end
    end
  end
end
