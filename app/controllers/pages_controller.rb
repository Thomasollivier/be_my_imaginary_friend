class PagesController < ApplicationController
  def home
    @perso = Personnality.all
  end
end
