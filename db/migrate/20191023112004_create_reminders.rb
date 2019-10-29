# frozen_string_literal: true

class CreateReminders < ActiveRecord::Migration[6.1]
  def change
    create_table :reminders do |t|
      t.integer :child_id, null: false
      t.integer :user_id, null: false
      t.string :reminder_type, null: false
      t.string :reminder_duration, null: false
      t.string :reminder_location, null: false
      t.timestamps
    end
  end
end
