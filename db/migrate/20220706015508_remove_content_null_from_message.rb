# frozen_string_literal: true

class RemoveContentNullFromMessage < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :content, :string, null: true
    change_column :comments, :reply_id, :integer, null: true
  end
end
