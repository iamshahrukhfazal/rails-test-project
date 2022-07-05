# frozen_string_literal: true

# Documentation for the Class
class ChangeDataTypeOfEnumInSuggestion < ActiveRecord::Migration[5.2]
  def change
    remove_column :suggestions, :status
    add_column :suggestions, :status, :integer, default: 1
  end
end
