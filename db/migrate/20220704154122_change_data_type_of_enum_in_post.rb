# frozen_string_literal: true

# Documentation for the Class
class ChangeDataTypeOfEnumInPost < ActiveRecord::Migration[5.2]
  reversible do |dir|
    change_table :posts, bulk: true do |t|
      dir.up do
        t.remove_column :status
        t.add_column :status, :integer
      end

      dir.down do
        t.remove_column :status
        t.add_column :status, :integer
      end
    end
  end
end
