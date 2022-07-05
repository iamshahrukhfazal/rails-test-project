# frozen_string_literal: true

# doc-documentation hello baby girl
class AddreportableidAndreportabletypeUniqness < ActiveRecord::Migration[5.2]
  def change
    remove_index :reports, %i[reportable_id reportable_type]
    add_index :reports, %i[reportable_id reportable_type], unique: true
  end
end
