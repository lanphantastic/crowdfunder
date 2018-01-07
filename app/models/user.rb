class User < ApplicationRecord
  has_secure_password

  # associations
  has_many :pledges
  has_many :projects
  has_many :pledges_projects, through: pledges, source: :project
  has_many :comments

  validates :password, length: { minimum: 8 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true
end
