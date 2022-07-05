# frozen_string_literal: true

class RemoveuniqueIndexFromReports < ActiveRecord::Migration[5.2]
  def change
    remove_index :reports, :user_id
  end
end
