# frozen_string_literal: true

# Documentation for the Class
class ChangeDataTypeOfEnumInReport < ActiveRecord::Migration[5.2]
  reversible do |dir|
    change_table :reports, bulk: true do |t|
      dir.up do
        t.remove_column :report_status
        t.add_column :report_status, :integer
      end

      dir.down do
        t.remove_column :report_status
        t.add_column :report_status, :integer
      end
    end
  end
end
