# frozen_string_literal: true

class AddNotNullToReport < ActiveRecord::Migration[5.2]
  def change
    change_column :reports, :reportable_type, :string, null: false
    change_column :reports, :reportable_id, :integer, null: false
    change_column :reports, :user_id, :bigint, null: false
  end
end
