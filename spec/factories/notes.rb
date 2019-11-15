# frozen_string_literal: true

FactoryBot.define do
  factory :note do
    child
    sequence(:note_body) { |n| "my lovely baby, note number #{n}" }

    trait :with_images do
      image { FilesTestHelper.png }
      image { FilesTestHelper.png }
      image { FilesTestHelper.png }
    end

    trait :with_one_image do
      image { FilesTestHelper.png }
    end
    factory :with_images, traits: [:with_images]
    factory :with_one_image, traits: [:with_one_image]
  end
end
