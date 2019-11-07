# frozen_string_literal: true

class CreateRbac < ActiveRecord::Migration[6.1]
  def change
    create_table :rbacs do |t|
      t.string :role, null: false
      t.string :rights, null: false
      t.timestamps
    end
  end
end
