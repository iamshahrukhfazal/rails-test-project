# frozen_string_literal: true

# Documentation for the Class
class ChangeDataTypeOfEnumInSuggestion < ActiveRecord::Migration[5.2]
  reversible do |dir|
    change_table :suggestions, bulk: true do |t|
      dir.up do
        t.remove_column :status
        t.add_column :status, :integer, default: 1
      end

      dir.down do
        t.remove_column :status
        t.add_column :status, :integer, default: 1
      end
    end
  end
end
