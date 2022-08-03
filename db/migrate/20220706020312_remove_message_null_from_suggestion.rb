# frozen_string_literal: true

class RemoveMessageNullFromSuggestion < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :suggestions, bulk: true do |t|
        dir.up do
          t.string :message
        end
      end
    end
  end
end
