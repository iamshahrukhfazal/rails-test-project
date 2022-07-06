# frozen_string_literal: true

# Service to download ftp files from the server
class AddParentToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :reply_id, :integer, null: true
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
