# frozen_string_literal: true

class AddNotNullToSuggestLikesLikeable < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :likes, bulk: true do |t|
        dir.up do
          t.string :likeable_type, null: false
        end
      end
    end
  end
end
