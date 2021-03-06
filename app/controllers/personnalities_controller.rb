class PersonnalitiesController < ApplicationController

  def list_owner
    @current = current_user
    @perso_array = []
    Personnality.all.each do |p|
      if p.user_id == @current.id
        @perso_array << p
      end
    end
  end


  def show
    @personnality = Personnality.find(params[:id])
    @rental = Rental.new

  end



  def new
    @personnality = Personnality.new
  end


  def create
    @personnality = Personnality.new(personnality_params)
    @personnality.user = current_user
    @personnality.sex.downcase!
    @personnality.main_emotion.downcase!
    @personnality.save!
    redirect_to list_owner_path
  end

  def index
    if params[:main_emotion] == ""
      @perso = Personnality.where(sex: params[:sex].downcase)
    else
      @perso = Personnality.where(sex: params[:sex].downcase, main_emotion: params[:main_emotion].downcase)
    end
    if @perso == []
      flash[:alert] = "We dont have any result using the param you entered"
      redirect_to root_path
    end
  end
  private

  def personnality_params
    params.require(:personnality).permit(:name, :age, :sex, :job, :description, :main_emotion,
      :photo, :photo_cache)
  end
end
