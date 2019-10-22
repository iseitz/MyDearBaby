# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  CARETAKERS = %w[mother father grandmother grandfather aunt uncle sister brother other_caretaker].freeze
  REMINDERS = %w[daily weekly monthly yearly].freeze
  WEEKLY_REMINDERS = %w[monday tuesday wednesday thursday friday saturday sunday].freeze
  MONTHLY_REMINDERS = %w[1 2 3 4 5 6 7 8 9,10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31].freeze
  ROLES = %w[member admin moderator].freeze
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :children
  validates :name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
  validates :status, presence: true, inclusion: { in: CARETAKERS }, uniqueness: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validtes :role, presence: true, inclusion: { in: ROLES }
  # may have 'member', 'admin' and 'moderator' roles, defaults to 'member'
  validates :encrypted_password, presence: true, confirmation: true
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true
  validates :reminders, inclusion: { in: REMINDERS }
  # mount_uploader :avatar, AvatarUploader
end
