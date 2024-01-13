class Appointment < ApplicationRecord

  validates :user_id, presence: true
  validates_comparison_of :scheduled_on, greater_than: Date.today
  validates :scheduled_on, uniqueness: true

  scope :future, -> { where scheduled_on: Date.tomorrow.. }

  # Broadcast changes in realtime with Hotwire
  # after_create_commit  -> do
  #   broadcast_prepend_to [user, :appointments],
  #     partial: "appointments/appointment",
  #     locals: { appointment: self }
  # end

  # after_update_commit  -> { broadcast_replace_later_to self }
  # after_destroy_commit -> { broadcast_remove_to :after_effects_templates, target: dom_id(self, :index) }
end
