class Appointment < ApplicationRecord

  validates :user_id, presence: true
  validates_comparison_of :scheduled_on, greater_than: Date.today
  validates :scheduled_on, uniqueness: true

  scope :future, -> { where scheduled_on: Date.tomorrow.. }

  after_create_commit -> do
    broadcast_update_to :appointments,
      partial: "appointments/form",
      locals: { appointment: Appointment.new },
      target: "new_appointment"
  end
end
