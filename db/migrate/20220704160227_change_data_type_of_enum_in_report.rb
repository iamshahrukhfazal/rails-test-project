# frozen_string_literal: true

# Documentation for the Class
class ChangeDataTypeOfEnumInReport < ActiveRecord::Migration[5.2]
  def change
    remove_column :reports, :report_status

    add_column :reports, :report_status, :integer, default: 1
  end
end
