# frozen_string_literal: true

# Documentation for the Class
class ChangeDataTypeOfEnumInPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :status
    add_column :posts, :status, :integer, default: 1
    # Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
