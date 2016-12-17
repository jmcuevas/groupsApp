class User < ApplicationRecord
  has_secure_password
  has_many :groups, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :group_memberships, through: :members, source: :group

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, length: {minimum: 2}, format: {with: /\A[a-zA-Z]+\z/}
  validates :password, length: {minimum: 8}, presence: true, confirmation: true, on: :create
end
