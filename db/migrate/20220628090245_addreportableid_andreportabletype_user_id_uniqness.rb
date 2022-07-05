# frozen_string_literal: true

# doc-documentation hello baby girl
class AddreportableidAndreportabletypeUserIdUniqness < ActiveRecord::Migration[5.2]
  def change
    add_index :reports, %i[reportable_id reportable_type user_id], unique: true
  end
end
