# frozen_string_literal: true

FactoryBot.define do
  factory :child do
    user
    sequence(:name) { |n| "name#{n}" }
    dob { 8.months.ago }
    sequence(:gender) { ['a boy', 'a girl', 'I prefer not to say'].sample }
    sequence(:color_theme) { %w[blue pink red cozy beige].sample }
    after(:build) do |child|
      child.notes { create_list(:note, 4) }
    end

    trait :with_avatar do
      avatar { FilesTestHelper.png }
    end

    factory :with_avatar, traits: [:with_avatar]
  end
end
