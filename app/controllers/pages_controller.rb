class PagesController < ApplicationController
  def home
    all_perso = Personnality.all
    @perso = all_perso.first(4)
  end
end
