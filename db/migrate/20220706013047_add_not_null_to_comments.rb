class AddNotNullToComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :content, :string, null: false
    change_column :comments, :reply_id, :integer, null: false
  end
end
