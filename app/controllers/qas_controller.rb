class QasController < ApplicationController
  def index
    @members = Member.all
    @qas = Qa.all
    @qa = Qa.new
  end

  def create
    @qa = Qa.new(qa_params)
    respond_to do |format|
      if @qa.save
        format.html { redirect_to qas_path, notice: "Great! You made a Qa item" }
      else
        format.html { render :new }
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
    params.require(:qa).permit(:title, :member_id, :completed)
  end

end
