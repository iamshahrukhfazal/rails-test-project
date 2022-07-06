# frozen_string_literal: true

# Service to download ftp files from the server
class AddLockableToDevise < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.integer :failed_attempts, default: 0, null: false
      t.datetime :locked_at
      t.string :unlock_token
      t.add_index :unlock_token, unique: true
    end
  end
end
