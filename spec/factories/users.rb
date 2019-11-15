# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "#{n}email#{n}@gmail.com" }
    sequence(:name) { |n| "name#{n}" }
    sequence(:last_name) { |n| "last_name#{n}" }
    sequence(:dob) { |n| (n + 20).years.ago }
    sequence(:status) { %w[mother father grandmother grandfather aunt uncle sister brother other_caretaker].sample }
    password { 'password' }
    password_confirmation { 'password' }
    role { 'member' }
    # if we do not test the mails sent out we can use this model:
    # after(:build, &:skip_confirmation_notification!)
    # after(:create, &:confirm)

    trait :admin do
      role { 'admin' }
    end

    trait :moderator do
      username { 'moderator' }
      role { 'moderator' }
    end

    trait :with_children do
      # after(:build) do |user|
      #   user.children { create_list(:child, 3) }
      # end

      after(:build) do |user|
       user.children = build_stubbed_list(:child, 3)
     end
    end

    trait :with_reminders do
      after(:build) do |user|
        user.reminders = build_stubbed_list(:reminder, 3)
      end
    end


    trait :with_avatar do
      avatar { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test-image.png'), 'image/png') }
    end

    #
    # factory :moderator, traits: [:moderator]
    # factory :admin, traits: [:admin]
    # factory :with_avatar, traits: [:with_avatar]
  end
end
