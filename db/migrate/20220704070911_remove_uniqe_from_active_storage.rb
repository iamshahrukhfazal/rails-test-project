# frozen_string_literal: true

# Documentation for the Class
class RemoveUniqeFromActiveStorage < ActiveRecord::Migration[5.2]
  def up
    remove_index :active_storage_attachments, %i[record_type record_id name blob_id]
    add_index :active_storage_attachments, %i[record_type record_id name blob_id],
              name: 'index_active_storage_attachments_uniqueness', unique: false
  end

  def down
    remove_index :active_storage_attachments, %i[record_type record_id name blob_id]
    add_index :active_storage_attachments, %i[record_type record_id name blob_id],
              name: 'index_active_storage_attachments_uniqueness', unique: true
  end
end
