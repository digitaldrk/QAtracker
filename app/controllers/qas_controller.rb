class QasController < ApplicationController
  before_filter :authenticate_user!

  def index
    @qa = Qa.new
    @teams = current_user.teams.all
    @memlist = current_user.members.all
  end

  def show
    @teams = current_user.teams.all
    @timeframe = @teams.where(:created_at => 2.weeks.ago..Time.now)
  end

  def create
    @qa = Qa.new(qa_params)
    respond_to do |format|
      if @qa.save
        format.html { redirect_to qas_path, notice: "Great! You made a Qa item" }
      else
        format.html { redirect_to qas_path, alert: "Whoops! Don't forget to add a Title or Member" }
      end   
    end
  end

  def update
    @qa = Qa.find(params[:id])
    @qa.update_attributes(qa_params)
    redirect_to qas_path, notice: 'Great Job!'
  end

  private

  def qa_params
    params.require(:qa).permit(:title, :member_id, :completed, :description, :team_id)
  end

end
