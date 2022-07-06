# frozen_string_literal: true

class RemoveContentNullFromMessage < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :suggestions, bulk: true do |t|
        dir.up do
          t.string :content
          t.integer :reply_id
        end
      end
    end
  end
end
