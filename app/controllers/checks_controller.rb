class ChecksController < ApplicationController
  before_action :achieve_string, only: [:create]
  
  def new
    @check = Check.new
  end
  
  def create
    @check = Check.new(check_params)
    @check.date = Time.zone.today
    if @check.save
      redirect_to root_path
    else
      render 'checks/new'
    end
  end
  
  private
  def check_params
    params.require(:check).permit(:user_id, :achieve)
  end
  
  def achieve_string
    params[:check][:achieve] = params[:check][:achieve].join(' / ') if params[:check][:achieve]
  end
end