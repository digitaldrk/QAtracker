class TeamsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.all
    @team = Team.new
    @teams = current_user.teams.all
    @members = @teams.each do |team|
      team.members
    end
  end

  def show
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

