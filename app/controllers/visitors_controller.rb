class VisitorsController < ApplicationController

  def index
    @qas = Qa.all
    render :layout => false
  end

end
