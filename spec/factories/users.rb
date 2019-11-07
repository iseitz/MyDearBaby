# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@gmail.com" }
    sequence(:name) { |n| "name#{n}" }
    sequence(:last_name) { |n| "last_name#{n}" }
    sequence(:dob) { |n| "December #{n}, 1983" }
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
    factory :moderator, traits: [:moderator]
    factory :admin, traits: [:admin]
  end
end
