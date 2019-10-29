# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  CARETAKERS = %w[mother father grandmother grandfather aunt uncle sister brother other_caretaker].freeze
  ROLES = %w[member admin moderator].freeze
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :children
  has_many :reminders
  validates :name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
  validates :status, presence: true, inclusion: { in: CARETAKERS }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :role, presence: true, inclusion: { in: ROLES }
  # may have 'member', 'admin' and 'moderator' roles, defaults to 'member'
  validates :encrypted_password, presence: true, confirmation: true
end
