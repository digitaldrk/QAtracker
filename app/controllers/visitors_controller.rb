class VisitorsController < ApplicationController

  def index
    puts @qas = Qa.all
    puts @teams = Team.find(1).members

  end


end