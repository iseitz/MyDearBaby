# frozen_string_literal: true

class Rbac < ApplicationRecord
  ROLES = %w[member admin moderator].freeze
  # RIGHTS = %w[edit_own_note remove_own_note edit_any_note remove_any_note remove_own_image remove_any_image create_own_child create_any_child edit_own_child edit_any_child remove_own_child remove_any_child remove_user].freeze
  validates :role, presence: true, inclusion: { in: ROLES }
  validates :rights, presence: true
end
