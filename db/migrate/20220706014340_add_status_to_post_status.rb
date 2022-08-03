# frozen_string_literal: true

class AddStatusToPostStatus < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :posts, bulk: true do |t|
        dir.up do
          t.string :status
        end
      end
    end
  end
end
