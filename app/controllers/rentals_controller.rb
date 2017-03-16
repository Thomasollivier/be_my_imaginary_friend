class RentalsController < ApplicationController
  def index
    @rentals = current_user.rentals
    @personnality = Personnality.new
  end

  def new
    @rental = Rental.new
  end


  def create

    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.personnality = Personnality.find(params[:personnality_id])

    @rental.save!
    redirect_to root_path
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
