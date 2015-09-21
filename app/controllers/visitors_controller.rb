class VisitorsController < ApplicationController

  def index
    @qas = Qa.all
    @teamone = Team.find(1).qas
    @teamtwo = Team.find(2).qas
  end

end
