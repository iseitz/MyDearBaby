# frozen_string_literal: true

class Child < ApplicationRecord
  GENDERS = %w[boy girl prefer not to say].freeze
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :reminders, dependent: :destroy
  validates :name, presence: true
  validates :gender, presence: true, inclusion: { in: GENDERS }
  validates :dob, presence: true
  validates :birth_date_nine_months_from_today
  validates :color_theme, presence: true
  validates :parent_id, presence: true

  private

  def birth_date_nine_months_from_today
    # it can be in the past or within 9 months from now
    if Date.today + 279 < :dob
      # Time.now + 9.months  OR
      # Time.now + 24_105_600
      errors.add(:dob, 'must be in the past or within 9 months from today')
    end
  end
end
