class RemoveMessageNullFromSuggestion < ActiveRecord::Migration[5.2]
  def change
    change_column :suggestions, :message, :string, null: true

  end
end
