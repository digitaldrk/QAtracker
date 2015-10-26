class MembersController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = current_user.teams.all
    @members = @teams.includes(:members).map { |t| t.members }.flatten
    @member = Member.new
  end

def create
  @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to members_path, notice: "Great! You made a member" }
      else
        format.html { redirect_to members_path, alert: "Whoops! Maybe you missed a field, maybe that Member already exists."}
      end
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :team_ids => [])
  end

end
