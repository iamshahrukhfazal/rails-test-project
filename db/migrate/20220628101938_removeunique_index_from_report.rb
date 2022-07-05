# frozen_string_literal: true

class RemoveuniqueIndexFromReport < ActiveRecord::Migration[5.2]
  def change
    remove_index :likes, %i[likeable_id likeable_type]
  end
end
