class TeamsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @team = current_user.teams.new
    @teams = current_user.teams.all
    @members = current_user.members.all
  end

  def show
    @teams = Team.all
  end

  def create
    @team = current_user.teams.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to teams_path, notice: "Great! You made a team" }
      else
        format.html { redirect_to teams_path, alert: "Whoops! You need to enter something in the field."}
      end
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    respond_to do |format|
    if @team.update_attributes(team_params)
        format.html { redirect_to teams_path, notice: "Great! You updated a team" }
    else 
        format.html { redirect_to teams_path, notice: "Things didn't go well" }
    end
  end
end

  private

  def team_params
    params.require(:team).permit(:name, :user_id)
  end

end

