# frozen_string_literal: true

class DobValidator < ActiveModel::Validator
  def validate(record)
    if Date.today + 279 < record.dob
      record.errors.add(:dob, 'Date of birth must be in the past or within 9 months from today')
    end
  end
end
