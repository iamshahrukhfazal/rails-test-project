# frozen_string_literal: true

# Service to download ftp files from the server
class Addindextoreport < ActiveRecord::Migration[5.2]
  def change
    add_index :reports, %i[user_id reportable_id reportable_type]
    add_index :reports, %i[reportable_id reportable_type]
  end
end
