# frozen_string_literal: true

class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.string :name, null: false
      t.datetime :dob
      t.string :gender, null: false
      t.string :color_theme
      t.integer :parent_id
      t.timestamps
    end
  end
end
