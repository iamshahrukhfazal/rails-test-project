# frozen_string_literal: true

# Service to download ftp files from the server
class AddConfirmableToDevise < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :users, bulk: true do |t|
        dir.up do
          t.string :confirmation_token
          t.datetime :confirmed_at
          t.datetime :confirmation_sent_at
          t.add_index :confirmation_token, unique: true
        end

        dir.down do
          t.remove_columns :confirmation_token, :confirmed_at, :confirmation_sent_at
          t.remove_index :confirmation_token
        end
      end
    end
  end
end
