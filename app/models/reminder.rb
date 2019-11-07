# frozen_string_literal: true

class Reminder < ApplicationRecord
  TYPES = %w[daily weekly yearly].freeze
  DURATION = %w[week month year].freeze
  LOCATION = %w[app email].freeze
  belongs_to :user
  belongs_to :child
  validates :reminder_type, presence: true, inclusion: { in: TYPES }
  validates :reminder_duration, presence: true, inclusion: { in: DURATION }
  validates :reminder_location, presence: true, inclusion: { in: LOCATION }
end
