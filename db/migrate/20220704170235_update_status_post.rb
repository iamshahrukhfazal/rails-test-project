# frozen_string_literal: true

# Documentation for the Class
class UpdateStatusPost < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :post, bulk: true do |t|
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
end
