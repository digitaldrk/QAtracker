class MembersController < ApplicationController
  before_action :authenticate_user!
  def index
    @teams = current_user.teams.all
    @members = Member.all
    @member = Member.new
  end

def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to members_path, notice: "Great! You made a member" }
      else
        format.html { render :new }
      end
    end
  end


  private

  def member_params
    params.require(:member).permit(:name, :team_id)
  end


end
