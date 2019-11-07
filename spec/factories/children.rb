# frozen_string_literal: true

FactoryBot.define do
  factory :child do
    user
    sequence(:name) { |n| "name#{n}" }
    sequence(:dob) { |n| "#{n}#{n + 1}#{n + 2}" }
    sequence(:gender) { ['a boy', 'a girl', 'I prefer not to say'].sample }
    sequence(:color_theme) { %w[blue pink red cozy beige].sample }
  end
end
