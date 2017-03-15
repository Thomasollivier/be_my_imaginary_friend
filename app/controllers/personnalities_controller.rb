class PersonnalitiesController < ApplicationController
  def new
    @personnality = Personnality.new
  end


  def create
    @personnality = Personnality.new(personnality_params)
    @personnality.save!
    redirect_to personnality_path(@personnality)
  end


  private

  def personnality_params
    params.require(:personnality).permit(:name, :age, :job, :friends, :main_emotion)
  end
end
