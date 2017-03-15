class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    all_perso = Personnality.all
    @perso = all_perso.first(4)
  end
end
