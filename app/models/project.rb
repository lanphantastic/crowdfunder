class Project < ApplicationRecord
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  has_many :updates
  belongs_to :user # project owner
  belongs_to :category
  has_many :claims

  has_many :comments
  validates :title, :user_id, :description, :goal, :start_date, :end_date, presence: true
  validates :goal, numericality: { greater_than_or_equal_to: 0 }
end
