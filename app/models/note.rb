# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :child
  # has_many_attached :images
  validates :note_body, presence: true
  validates :child_id, presence: true
end
