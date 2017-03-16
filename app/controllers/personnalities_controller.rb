class PersonnalitiesController < ApplicationController
  def new
    @personnality = Personnality.new
  end


  def create
    @personnality = Personnality.new(personnality_params)
    @personnality.user = current_user

    @personnality.save!
    redirect_to personnality_path(@personnality)
  end


  private

  def personnality_params
    params.require(:personnality).permit(:name, :age, :sex, :job, :description, :main_emotion)
  end
end
