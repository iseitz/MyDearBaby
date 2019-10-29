# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :note_body, null: false
      t.integer :child_id, presence: true
      t.timestamps
    end
  end
end
