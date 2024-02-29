class User < ApplicationRecord
  ROLES = %w[vendor customer].freeze

  has_secure_password

  has_many :products
  has_many :cart_items

  validates :name, :email, :role, presence: true
  validates :role, presence: true, inclusion: { in: ROLES }
end
