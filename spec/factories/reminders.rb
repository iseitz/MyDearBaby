# frozen_string_literal: true

FactoryBot.define do
  factory :reminder do
    user
    child
    sequence(:reminder_type) { %w[daily weekly yearly].sample }
    sequence(:reminder_duration) { %w[week month year].sample }
    sequence(:reminder_location) { %w[app email].sample }
  end
end
