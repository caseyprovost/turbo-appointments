class Appointment < ApplicationRecord
  validates :user_id, presence: true
  validates_comparison_of :scheduled_on, greater_than: Date.today
  validates :scheduled_on, uniqueness: true

  scope :future, -> { where scheduled_on: Date.tomorrow.. }
end
