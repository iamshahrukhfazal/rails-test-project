# frozen_string_literal: true

class RemoveLinksFromPost < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :posts, bulk: true do |t|
        dir.up do
          t.remove_column :links
        end
      end
    end
  end
end
