# frozen_string_literal: true

class AddTitileToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :string, default: ''
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
