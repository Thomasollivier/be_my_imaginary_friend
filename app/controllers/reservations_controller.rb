class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def accept
    @reservation = Reservation.find(params[:id])
    @reservation.status = "accepted"
    @reservation.save!
    redirect_to reservations_path

  end

  def refuse
    @reservation = Reservation.find(params[:id])
    @reservation.status = "refuse"
    @reservation.save!
    redirect_to reservations_path
  end



end
