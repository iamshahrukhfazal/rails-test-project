class RemoveLinksFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :links
  end
end
