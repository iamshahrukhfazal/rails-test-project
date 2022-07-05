# frozen_string_literal: true

class RemoveuniqueIndexFromLikes < ActiveRecord::Migration[5.2]
  def change
    remove_index :reports, %i[reportable_id reportable_type]
  end
end
