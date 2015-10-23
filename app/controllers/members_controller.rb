class MembersController < ApplicationController
  before_action :authenticate_user!
  def index
    @teams = current_user.teams.all
    @members = @teams.includes(:members).map { |t| t.members }.flatten
    @member = Member.new
    @qas = Qa.all
  end

def create
  @member = Member.new(member_params)
  #@member << team
  #@member << Member.create(member_params)
    respond_to do |format|
      if @member.save
        format.html { redirect_to members_path, notice: "Great! You made a member" }
      else
        format.html { redirect_to members_path, alert: "Whoops! Maybe you missed a field, maybe that Member already exists."}
      end
    end
  end

  def add_member_to_team
    # Maybe even just use rails forms
    # override the url that the form posts to (action)
    # hook that up in routes, maybe to this controller method?
    # @members = Member.where(:id => params[member_params])
    # @team.members << @members
    # at that point, you'll get an instance of AddMemberToTeam
    # get a team from AddMemberToTeam.team_id
    # either get a user from .member_id, or create a new member based on the name
    # TODO add the member to the team, which involves creating a new members_teams row
    # "form Object"
    # ""
  end

  private

  def member_params
    params.require(:member).permit(:name, :team_ids => [])
  end
# :team_ids => [] <-- should this be in params?
# :member_team <-- should this be in params?

end
