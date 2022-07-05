# frozen_string_literal: true

# Service to download ftp files from the server
class AddStatusFeildToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :status, :integer, default: 1
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
