# frozen_string_literal: true

class RemovedefaultstatusOfUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role, :integer, default: nil
    # Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
