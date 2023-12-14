class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ destroy ]

  def index
    @appointments = Current.user.appointments
    @appointment = Appointment.new
  end

  def create
    @appointment = Current.user.appointments.new appointment_params

    if @appointment.save
      redirect_to root_path
    else
      @appointments = Current.user.appointments
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy!
    redirect_to root_path
  end

private

  def set_appointment
    @appointment = Appointment.find params[:id]
  end

  def appointment_params
    params.require(:appointment).permit(:scheduled_on)
  end
end
