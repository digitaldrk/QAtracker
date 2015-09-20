class TeamsController < ApplicationController
  def index
    @users = User.all
    @team = Team.new
    @teams = Team.all
  end

  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to teams_path, notice: "Great! You made a team" }
      else
        format.html { render :new }
      end
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :user_id)
  end

end
