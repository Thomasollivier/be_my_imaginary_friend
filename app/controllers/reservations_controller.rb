class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def accept
    @reservation = Rental.find(params[:id])
    @reservation.status = "accepted"
    @reservation.save!
    redirect_to reservations_path

  end

  def refuse
    @reservation = Rental.find(params[:id])
    @reservation.status = "refuse"
    @reservation.save!
    redirect_to reservations_path
  end



end
