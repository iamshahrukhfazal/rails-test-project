class AddNotNullToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :title, :string, null: false
    change_column :posts, :content, :string, null: false
    change_column :posts, :user_id, :bigint, null: false

    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
