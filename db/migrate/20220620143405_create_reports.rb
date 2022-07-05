# frozen_string_literal: true

# Service to download ftp files from the server
class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :reportable_type
      t.integer :reportable_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
