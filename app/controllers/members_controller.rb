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
        format.html { redirect_to members_path, alert: "Whoops! You probably entered a name of a Member that already exists."}
      end
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    respond_to do |format|
      if @member.update_attributes(member_params)
        format.html { redirect_to members_path, notice: "You successfully changed that member's name." }
      else 
        format.html { redirect_to members_path, notice: "Things didn't go well" }
      end
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :team_ids => [])
  end

end
