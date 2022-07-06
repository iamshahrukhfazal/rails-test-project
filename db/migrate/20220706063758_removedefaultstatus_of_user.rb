# frozen_string_literal: true

class RemovedefaultstatusOfUser < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :users, bulk: true do |t|
        dir.up do
          t.integer :role
        end
      end
    end
  end
end
