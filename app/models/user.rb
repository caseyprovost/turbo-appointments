class User
  include ActiveModel::Model
  attr_accessor :id

  def appointments
    Appointment.where(user_id: id).order created_at: :desc
  end

  def short_id
    id[..4]
  end
end