# frozen_string_literal: true

class Child < ApplicationRecord
  GENDERS = ['a boy', 'a girl', 'I prefer not to say'].freeze
  THEMES = %w[blue pink red cozy beige].freeze
  belongs_to :user
  has_many :notes, dependent: :destroy
  has_many :reminders, dependent: :destroy
  # has_one_attached :avatar
  validates :name, presence: true
  validates :gender, presence: true, inclusion: { in: GENDERS }
  validates :dob, presence: true
  # include ActiveModel::Validations
  # validates_with DobValidator
  validate :birth_date_max
  validates :color_theme, presence: true, inclusion: { in: THEMES }
  validates :user_id, presence: true

  private

  # date of birth can be in the past or within 9 months from now
  def birth_date_max
    if dob.present? && dob > Date.today + 279
      # Time.now + 9.months  OR
      # Time.now + 24_105_600
      errors.add(:dob, 'must be in the past or within 9 months from today')
    end
  end
end
