class TemperaturesController < ApplicationController
  before_action :health_string, only: [:create]
  
  def index
    @temperature = current_user.temperatures
    @checks = current_user.checks
  end
  
  def new
    @temperature = Temperature.new
  end
  
  def create
    @temperature = Temperature.new(temperature_params)
    @temperature.date = Time.zone.today                      #日付は送られてこないので代入
    if @temperature.save
      redirect_to root_path
    else
      render 'temperatures/new'
    end
  end
  
  def filter
    @filter_params = filter_params
    @temperature = Temperature.health_filter(@filter_params).includes(:user).where(user_id: current_user.id)
  end
  
  private
  def temperature_params
    params.require(:temperature).permit(:user_id, :taion, :health)
  end
  
  def health_string
    params[:temperature][:health] = params[:temperature][:health].join(' / ') if params[:temperature][:health]  #チェックが入っていれば、配列で送られるhealthを文字列に変換('/'区切り)
  end
  
  def filter_params
    params.fetch(:health_filter, {}).permit(:day_from, :day_to, :health)
  end
end