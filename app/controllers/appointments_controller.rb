class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ destroy ]

  def index
    @appointments = Current.user.appointments
    @appointment = Appointment.new
  end

  def create
    @appointment = Current.user.appointments.new(appointment_params)
    @success = @appointment.save
  end

  def destroy
    @appointment.destroy!
    redirect_to root_path
  end

private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:scheduled_on)
  end
end
