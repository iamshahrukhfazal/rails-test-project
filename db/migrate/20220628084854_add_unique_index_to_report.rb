# frozen_string_literal: true

# doc-documentation hello baby girl
class AddUniqueIndexToReport < ActiveRecord::Migration[5.2]
  def change
    remove_index :reports, :user_id
    add_index :reports, :user_id, unique: true
  end
end
