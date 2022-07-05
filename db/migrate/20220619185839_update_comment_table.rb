# frozen_string_literal: true

# Service to download ftp files from the server
class UpdateCommentTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :post_id, :likeable_id
    # Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    add_column :likes, :likeable_type, :string
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")

    remove_index :likes, %i[user_id likeable_id]

    add_index :likes, %i[user_id likeable_id likeable_type], unique: true
    add_index :likes, %i[likeable_id likeable_type]
    # Ex:- add_index("admin_users", "username")
  end
end
