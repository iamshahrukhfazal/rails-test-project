class RemoveContentNullFromPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :content, :string, null: true
  end
end
